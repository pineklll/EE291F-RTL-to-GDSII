####################################################################################################
## Genus Stage 03: Map
####################################################################################################

source [file join [file dirname [info script]] env.tcl]

set STAGE_NAME  03_map
set STAGE_DIR   [stage_make_dir ${GENUS_BUILD} ${STAGE_NAME}]
set STAGE_DB    [file join ${STAGE_DIR} ${DESIGN}.db]

# Restore previous stage
read_db [file join ${GENUS_BUILD} 02_generic ${DESIGN}.db]

# ---------------------------------------------------------------- #
# Config

# Apply timing uncertainty for stage map
c_sdc_modify_uncertainty ${MAP_UNCERTAINTY_TS} ${MAP_UNCERTAINTY_TH} ${CLK_NAME}

# ---------------------------------------------------------------- #
# Map

# Synthesize design (optimize and generate mapped netlist)
syn_map

# ---------------------------------------------------------------- #
# Report

# Create report pack and snapshot
write_snapshot -directory ${STAGE_DIR} -tag syn_map

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
