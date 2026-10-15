set TOOL genus

# Load shared configuration
source [file join [file dirname [info script]] .. path.tcl]
source [file join ${SCRIPT_DIR} tech.tcl]
source [file join ${SCRIPT_DIR} design.tcl]
source [file join ${SCRIPT_DIR} helper.tcl]

# Load tool setting
source [file join ${GENUS_SCRIPT} setting.tcl]
