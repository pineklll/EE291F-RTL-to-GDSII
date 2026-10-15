####################################################################################################
## Genus Setting
####################################################################################################

# ---------------------------------------------------------------- #
# Timing

set GEN_UNCERTAINTY_TS       1.25
set GEN_UNCERTAINTY_TH       0.05
set MAP_UNCERTAINTY_TS       1.00
set MAP_UNCERTAINTY_TH       0.05
set OPT_UNCERTAINTY_TS       0.75
set OPT_UNCERTAINTY_TH       0.05
set GENUS_UNCERTAINTY_TS     0.50
set GENUS_UNCERTAINTY_TH     0.05

# ---------------------------------------------------------------- #
# Stage

set GENUS_STAGES [list 01_elaborate 02_generic 03_map 04_opt 05_final]

# ---------------------------------------------------------------- #
# Synthesis

# Effort of synthesis
set SYN_GENERIC_EFFORT high
set SYN_MAP_EFFORT high
set SYN_OPT_EFFORT high

# ---------------------------------------------------------------- #
# Constraint

# List of constraint modes to export
set SDC_LIST [list \
    [list func_main ${GENUS_SDC_MAIN}] \
]

# ---------------------------------------------------------------- #
# Cells

# List of dont use cells
# DEL     : cell for delay
# ANT     : cell for route (reduce antenna effect of wire)
# FILL    : cell to fill the blank in row
# TAP     : cell to provide connection for well
# CLK     : cell for clock tree
# GCK     : cell for clock gating
# TIE     : cell for logic constant 0 / 1
# X20AR9  : cell with max drive strength
# X05AR9  : cell with min drive strength
set DONT_USE_CELL_PATTERNS [list \
    {*DEL*} \
    {*ANT*} \
    {*FILL*} \
    {*TAP*} \
    {*CLK*} \
    {*GCK*} \
    {*TIE*} \
    {*X20A?9} \
    {*X05A?9} \
]
