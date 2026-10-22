set TOOL dc

# Load shared configuration
source [file join [file dirname [info script]] .. path.tcl]
source [file join ${SCRIPT_DIR} tech.tcl]
source [file join ${SCRIPT_DIR} design.tcl]
source [file join ${SCRIPT_DIR} helper.tcl]

# Load tool setting
source [file join ${DC_SCRIPT} setting.tcl]

set_host_options -max_cores 8

# Search path of library
set_app_var search_path [concat ${search_path} ${DC_LIB_DIRS}]

# Library of cells that rtl can be mapped to
# Always use "max" here
set_app_var target_library ${DC_LIB_MAX}

set_app_var link_library [concat * ${DC_LIB_MAX}]

# Do not use some cells (the libraries are loaded by get_lib_cells here)
set_dont_use [s_get_base_cell_names ${DONT_USE_CELL_PATTERNS}]

# Library of cells for timing analysis
# Require both "max" and "min" here
foreach DC_MAX_LIB ${DC_LIB_MAX} DC_MIN_LIB ${DC_LIB_MIN} {
    set_min_library ${DC_MAX_LIB} -min_version ${DC_MIN_LIB}
}