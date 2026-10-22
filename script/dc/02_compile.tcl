source [file join [file dirname [info script]] env.tcl]

set STAGE_NAME  02_compile
set STAGE_DIR   [stage_make_dir ${DC_BUILD} ${STAGE_NAME}]
set STAGE_DDC   [file join ${STAGE_DIR} ${DESIGN}.ddc]

# Record the setup information for formal verification
set_svf ${DC_SVF_02}

# Restore previous stage
remove_design -designs
read_file -format ddc [file join ${DC_BUILD} 01_elaborate ${DESIGN}.ddc]

# ---------------------------------------------------------------- #
# Constraint

# Read design constraints
source -echo -verbose ${SDC_FILE}

# Apply timing uncertainty for stage compile
s_sdc_modify_uncertainty ${SYN_UNCERTAINTY_TS} ${SYN_UNCERTAINTY_TH} ${CLK_NAME}

# ---------------------------------------------------------------- #
# Compile

# Synthesis design (generate mapped netlist)
compile_ultra

# ---------------------------------------------------------------- #
# Export

# Export netlist before final stage
write -hierarchy -format verilog -output [file join ${STAGE_DIR} netlist.v]

# ---------------------------------------------------------------- #
# Save

# Save design database
write -hierarchy -format ddc -output ${STAGE_DDC}

# Stop recording the setup information for formal verification
set_svf -off
