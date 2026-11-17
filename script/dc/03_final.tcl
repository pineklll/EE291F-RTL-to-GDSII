source [file join [file dirname [info script]] env.tcl]

set STAGE_NAME  03_final
set STAGE_DIR   [stage_make_dir ${DC_BUILD} ${STAGE_NAME}]
set STAGE_DDC   [file join ${STAGE_DIR} ${DESIGN}.ddc]

# Restore previous stage
remove_design -designs
read_file -format ddc [file join ${DC_BUILD} 02_compile ${DESIGN}.ddc]

# ---------------------------------------------------------------- #
# Constraint

# Apply timing uncertainty for stage final
s_sdc_modify_uncertainty ${DC_UNCERTAINTY_TS} ${DC_UNCERTAINTY_TH} ${CLK_NAME}

# ---------------------------------------------------------------- #
# Report

# Create report
report_qor  > [file join ${STAGE_DIR} report_qor.rpt]
report_area > [file join ${STAGE_DIR} report_area.rpt]
report_timing -transition_time -nets -attributes -nosplit > [file join ${STAGE_DIR} report_timing.rpt]

# ---------------------------------------------------------------- #
# Export

# Export netlist
write -hierarchy -format verilog -output ${DC_NETLIST}

# Export constraints
write_sdc ${DC_SDC}

# Export delay
write_sdf ${DC_SDF}

# ---------------------------------------------------------------- #
# Save

# Save design database
write -hierarchy -format ddc -output ${STAGE_DDC}