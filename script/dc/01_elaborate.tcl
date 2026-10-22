source [file join [file dirname [info script]] env.tcl]

set STAGE_NAME  01_elaborate
set STAGE_DIR   [stage_make_dir ${DC_BUILD} ${STAGE_NAME}]
set STAGE_DDC   [file join ${STAGE_DIR} ${DESIGN}.ddc]

# Record the setup information for formal verification
set_svf ${DC_SVF_01}

# ---------------------------------------------------------------- #
# Import

# Define design lib
define_design_lib main -path [file join ${STAGE_DIR} main]

# Analyze rtl
analyze -format verilog ${RTL_LIST} -library main

# ---------------------------------------------------------------- #
# Elaborate

# Elaborate design (generate generic netlist)
elaborate ${DESIGN} -library main

# ---------------------------------------------------------------- #
# Constraint

# Protect clock and reset networks
set_dont_touch_network [get_ports ${PORT_CLK}]
set_dont_touch_network [get_ports ${PORT_RST}]

# ---------------------------------------------------------------- #
# Report

# Check design before synthesis
check_design > [file join ${STAGE_DIR} check_design.rpt]

# ---------------------------------------------------------------- #
# Export

# Export generic netlist (before technology mapping)
write -hierarchy -format verilog -output [file join ${STAGE_DIR} netlist.v]

# ---------------------------------------------------------------- #
# Save

# Save design database
write -hierarchy -format ddc -output ${STAGE_DDC}

# Stop recording the setup information for formal verification
set_svf -off
