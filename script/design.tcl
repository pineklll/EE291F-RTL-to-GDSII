####################################################################################################
## Shared Design Configuration
####################################################################################################

# ---------------------------------------------------------------- #
# Design

set DESIGN                mmForMLP
set CLK_NAME              main_clk
set PORT_CLK              clk
set PORT_RST              resetn

# ---------------------------------------------------------------- #
# Input

set RTL_LIST              [list [file join ${RTL_DIR} ${DESIGN}.v]]
set SDC_FILE              [file join ${SDC_DIR} ${DESIGN}.sdc]

# ---------------------------------------------------------------- #
# Genus Output

set GENUS_FINAL_DIR       [file join ${GENUS_BUILD} 05_final]
set GENUS_NETLIST         [file join ${GENUS_FINAL_DIR} ${DESIGN}_syn.v]
set GENUS_SDC_MAIN        [file join ${GENUS_FINAL_DIR} ${DESIGN}_syn_func_main.sdc]

# ---------------------------------------------------------------- #
# DC Output

set DC_FINAL_DIR          [file join ${DC_BUILD} 03_final]
set DC_NETLIST            [file join ${DC_FINAL_DIR} ${DESIGN}_syn.v]
set DC_SDC                [file join ${DC_FINAL_DIR} ${DESIGN}_syn.sdc]
set DC_SDF                [file join ${DC_FINAL_DIR} ${DESIGN}_syn.sdf]

# Setup information for formal verification
set DC_SVF_01             [file join ${DC_BUILD} 01_elaborate ${DESIGN}.svf]
set DC_SVF_02             [file join ${DC_BUILD} 02_compile ${DESIGN}.svf]
