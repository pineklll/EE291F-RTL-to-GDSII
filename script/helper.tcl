####################################################################################################
## Shared Flow Helper
####################################################################################################

# Create stage directory
proc stage_make_dir {build_dir stage_name} {
    set stage_dir [file join ${build_dir} ${stage_name}]
    file delete -force ${stage_dir}
    file mkdir ${stage_dir}
    return ${stage_dir}
}

# ---------------------------------------------------------------- #
# Synopsys

# Return unique library-cell names matching wildcard patterns
proc s_get_base_cell_names {patterns} {
    set names [list]
    foreach pattern ${patterns} {
        foreach_in_collection cell [get_lib_cells */${pattern}] {
            lappend names [get_object_name ${cell}]
        }
    }
    return [lsort -unique ${names}]
}

# Update the clock uncertainty with stage-specific values
proc s_sdc_modify_uncertainty {uncertainty_ts uncertainty_th clk_name} {
    set_clock_uncertainty -setup ${uncertainty_ts} [get_clocks ${clk_name}]
    set_clock_uncertainty -hold  ${uncertainty_th} [get_clocks ${clk_name}]
}

# ---------------------------------------------------------------- #
# Cadence

# Return unique base-cell names matching wildcard patterns
proc c_get_base_cell_names {patterns} {
    set names [list]
    foreach pattern ${patterns} {
        foreach cell [get_db base_cells ${pattern}] {
            lappend names [get_db ${cell} .name]
        }
    }
    return [lsort -unique ${names}]
}

# Update active constraint modes with stage-specific clock uncertainty
proc c_sdc_modify_uncertainty {uncertainty_ts uncertainty_th clk_name} {
    set_interactive_constraint_modes [get_db constraint_modes -if {.is_active == true}]
    set_clock_uncertainty -setup ${uncertainty_ts} [get_clocks ${clk_name}]
    set_clock_uncertainty -hold  ${uncertainty_th} [get_clocks ${clk_name}]
    set_interactive_constraint_modes {}
}
