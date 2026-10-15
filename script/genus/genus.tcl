####################################################################################################
## Genus Main Script
####################################################################################################

source [file join [file dirname [info script]] env.tcl]

# ---------------------------------------------------------------- #
# Stage

# Run every stage
foreach STAGE ${GENUS_STAGES} {
    source [file join ${GENUS_SCRIPT} ${STAGE}.tcl]
}

# Quit
exit
