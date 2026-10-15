####################################################################################################
## Genus Stage 02: Generic
####################################################################################################

source [file join [file dirname [info script]] env.tcl]

set STAGE_NAME  02_generic
set STAGE_DIR   [stage_make_dir ${GENUS_BUILD} ${STAGE_NAME}]
set STAGE_DB    [file join ${STAGE_DIR} ${DESIGN}.db]

# Restore previous stage
read_db [file join ${GENUS_BUILD} 01_elaborate ${DESIGN}.db]

# ---------------------------------------------------------------- #
# Config

# Apply timing uncertainty for stage generic
c_sdc_modify_uncertainty ${GEN_UNCERTAINTY_TS} ${GEN_UNCERTAINTY_TH} ${CLK_NAME}

# ---------------------------------------------------------------- #
# Generic

# Synthesize design (optimize generic netlist)
syn_generic

# ---------------------------------------------------------------- #
# Report

# Create report pack and snapshot
write_snapshot -directory ${STAGE_DIR} -tag syn_generic

# Create report summary
report_summary -directory ${STAGE_DIR}

# ---------------------------------------------------------------- #
# Export

# Export netlist
write_netlist > [file join ${STAGE_DIR} netlist.v]

# ---------------------------------------------------------------- #
# Save

# Save database
write_db -to_file ${STAGE_DB}
