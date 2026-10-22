####################################################################################################
## DC Setting
####################################################################################################

# ---------------------------------------------------------------- #
# Timing

set SYN_UNCERTAINTY_TS 1.50
set SYN_UNCERTAINTY_TH 0.05
set DC_UNCERTAINTY_TS  0.50
set DC_UNCERTAINTY_TH  0.05

# ---------------------------------------------------------------- #
# Stage

set DC_STAGES [list 01_elaborate 02_compile 03_final]

# ---------------------------------------------------------------- #
# Library

# Library search path (libraries are loaded by name under search path)
set DC_LIB_DIRS [list \
    [file join ${LIB_DIR} std] \
    [file join ${LIB_DIR} mem] \
    [file join ${DB_DIR} std] \
    [file join ${DB_DIR} mem] \
]

# Library of the maximum delay corner
set DC_LIB_MAX [list \
    [file tail ${DB_STD_RVT_SS}] \
    [file tail ${DB_STD_LVT_SS}] \
    [file tail ${DB_MEM_M1024_SS}] \
    [file tail ${DB_MEM_M0256_SS}] \
]

# Library of the minimum delay corner
set DC_LIB_MIN [list \
    [file tail ${DB_STD_RVT_FF}] \
    [file tail ${DB_STD_LVT_FF}] \
    [file tail ${DB_MEM_M1024_FF}] \
    [file tail ${DB_MEM_M0256_FF}] \
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
