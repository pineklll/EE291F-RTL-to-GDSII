####################################################################################################
## Formal Main Script
####################################################################################################

# ---------------------------------------------------------------- #
# Preparation

set TOOL formal

# Load shared configuration
source [file join [file dirname [info script]] .. path.tcl]
source [file join ${SCRIPT_DIR} tech.tcl]
source [file join ${SCRIPT_DIR} design.tcl]

# Load tool setting
source [file join ${FORMAL_SCRIPT} setting.tcl]

# Use multiple cpu
set_host_options -max_cores 8

# ---------------------------------------------------------------- #
# Directory

file mkdir ${OUTPUT_DIR}

# ---------------------------------------------------------------- #
# Config

set synopsys_auto_setup true

# ---------------------------------------------------------------- #
# Import

# Read technology library
foreach DB_FILE ${DB_LIST_FF} {
    read_db ${DB_FILE}
}

# Set svf
set_svf -ordered ${DC_SVF_01} ${DC_SVF_02}

# Read reference design
read_verilog -container r -libname WORK ${RTL_LIST}
set_top r:/WORK/${DESIGN}

# Read implementation design
read_verilog -container i -libname WORK ${DC_NETLIST}
set_top i:/WORK/${DESIGN}

# ---------------------------------------------------------------- #
# Verify

verify

# ---------------------------------------------------------------- #
# Report

report_guidance > [file join ${OUTPUT_DIR} report_guidance.rpt]
report_failing_points > [file join ${OUTPUT_DIR} report_failing_points.rpt]
report_unmatched_points > [file join ${OUTPUT_DIR} report_unmatched_points.rpt]
report_black_boxes > [file join ${OUTPUT_DIR} report_black_boxes.rpt]

# ---------------------------------------------------------------- #
# Export

save_session -replace [file join ${FORMAL_BUILD} ${DESIGN}_formal_session]
