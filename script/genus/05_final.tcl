####################################################################################################
## Genus Stage 05: Final
####################################################################################################

source [file join [file dirname [info script]] env.tcl]

set STAGE_NAME  05_final
set STAGE_DIR   [stage_make_dir ${GENUS_BUILD} ${STAGE_NAME}]
set STAGE_DB    [file join ${STAGE_DIR} ${DESIGN}.db]

# Restore previous stage
read_db [file join ${GENUS_BUILD} 04_opt ${DESIGN}.db]

# ---------------------------------------------------------------- #
# Config

# Apply timing uncertainty for genus
c_sdc_modify_uncertainty ${GENUS_UNCERTAINTY_TS} ${GENUS_UNCERTAINTY_TH} ${CLK_NAME}

# ---------------------------------------------------------------- #
# Report

# Create report pack and snapshot
write_snapshot -innovus -directory ${STAGE_DIR} -tag genus

# Create report summary
report_summary -directory ${STAGE_DIR}

# ---------------------------------------------------------------- #
# Export

# Export netlist
write_netlist > ${GENUS_NETLIST}

# Export constraints
foreach SDC_TARGET ${SDC_LIST} {
    lassign ${SDC_TARGET} CONSTRAINT_MODE SDC_OUT
    write_sdc -constraint_mode ${CONSTRAINT_MODE} -exclude {set_dont_touch_network set_dont_use} > ${SDC_OUT}
}

# ---------------------------------------------------------------- #
# Save

# Save database
write_db -to_file ${STAGE_DB}
