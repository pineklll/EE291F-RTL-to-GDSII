####################################################################################################
## Shared Path Configuration
####################################################################################################

# ---------------------------------------------------------------- #
# Project

set PROJECT_DIR           [file dirname [file dirname [file normalize [info script]]]]

set TECH_DIR              [file join ${PROJECT_DIR} tech]
set INPUT_DIR             [file join ${PROJECT_DIR} input]
set BUILD_DIR             [file join ${PROJECT_DIR} build]
set SCRIPT_DIR            [file join ${PROJECT_DIR} script]

# ---------------------------------------------------------------- #
# Technology

set LEF_DIR               [file join ${TECH_DIR} lef]
set LIB_DIR               [file join ${TECH_DIR} lib]
set DB_DIR                [file join ${TECH_DIR} db]
set QRC_DIR               [file join ${TECH_DIR} qrc]
set GDS_DIR               [file join ${TECH_DIR} gds]
set MAP_DIR               [file join ${TECH_DIR} map]
set TF_DIR                [file join ${TECH_DIR} tf]
set NDM_DIR               [file join ${TECH_DIR} ndm]

# ---------------------------------------------------------------- #
# Input

set RTL_DIR               [file join ${INPUT_DIR} rtl]
set SDC_DIR               [file join ${INPUT_DIR} sdc]

# ---------------------------------------------------------------- #
# Build

set GENUS_BUILD           [file join ${BUILD_DIR} genus]
set DC_BUILD              [file join ${BUILD_DIR} dc]
set INNOVUS_BUILD         [file join ${BUILD_DIR} innovus]
set ICC2_BUILD            [file join ${BUILD_DIR} icc2]
set FORMAL_BUILD          [file join ${BUILD_DIR} formal]

# ---------------------------------------------------------------- #
# Script

set GENUS_SCRIPT          [file join ${SCRIPT_DIR} genus]
set DC_SCRIPT             [file join ${SCRIPT_DIR} dc]
set INNOVUS_SCRIPT        [file join ${SCRIPT_DIR} innovus]
set ICC2_SCRIPT           [file join ${SCRIPT_DIR} icc2]
set FORMAL_SCRIPT         [file join ${SCRIPT_DIR} formal]
