####################################################################################################
## Genus Stage 04: Opt
####################################################################################################

source [file join [file dirname [info script]] env.tcl]

set STAGE_NAME  04_opt
set STAGE_DIR   [stage_make_dir ${GENUS_BUILD} ${STAGE_NAME}]
set STAGE_DB    [file join ${STAGE_DIR} ${DESIGN}.db]

# Restore previous stage
read_db [file join ${GENUS_BUILD} 03_map ${DESIGN}.db]

# ---------------------------------------------------------------- #
# Config

# Apply timing uncertainty for stage opt
c_sdc_modify_uncertainty ${OPT_UNCERTAINTY_TS} ${OPT_UNCERTAINTY_TH} ${CLK_NAME}

# ---------------------------------------------------------------- #
# Optimize

# Synthesize design (optimize mapped netlist)
syn_opt

# ---------------------------------------------------------------- #
# Report

# Create report pack and snapshot
write_snapshot -directory ${STAGE_DIR} -tag syn_opt

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