####################################################################################################
## Shared Technology Configuration
####################################################################################################

# ---------------------------------------------------------------- #
# Corner (PVT)

# Temperature (H = high, L = low)
set TEMP_H                125
set TEMP_L                -40

# Voltage (H = high, L = low)
set VOLT_H                1.32
set VOLT_L                1.08

# Power net names
set PWR_NET               VDD
set GND_NET               VSS
set PG_NETS               [list ${PWR_NET} ${GND_NET}]

# Power rails for typical power analysis
set POWER_RAILS [list \
    [list ${PWR_NET}    1.2] \
    [list ${GND_NET}    0.0] \
]

# ---------------------------------------------------------------- #
# Field

# Names of tech
set N_TECH(NAME)          HL055P_7M6X1T4_RDL

# Names of std
set N_STD(RVT)            M31GPSC900HL055PR
set N_STD(LVT)            M31GPSC900HL055PL
set N_STD(FF)             N40CFF1P32_cbest_ccs
set N_STD(SS)             125CSS1P08_cworst_ccs

# Names of mem
set N_MEM(M1024)          mem55lpw1024d16sp
set N_MEM(M0256)          mem55lpw256d16sp
set N_MEM(FF)             ff1p32vn40c
set N_MEM(SS)             ss1p08v125c

# Names of qrc
set N_QRC(NAME)           qrcTechFile
set N_QRC(CCB)            cbest
set N_QRC(CCW)            cworst

# Names of map
set N_MAP(CADEN)          streamout
set N_MAP(SYNOP)          icc2gds

# ---------------------------------------------------------------- #
# File

# Files of lef
set LEF_TECH              [file join ${LEF_DIR} tech ${N_TECH(NAME)}.lef]
set LEF_STD_RVT           [file join ${LEF_DIR} std ${N_STD(RVT)}.lef]
set LEF_STD_LVT           [file join ${LEF_DIR} std ${N_STD(LVT)}.lef]
set LEF_MEM_M1024         [file join ${LEF_DIR} mem ${N_MEM(M1024)}.plef]
set LEF_MEM_M0256         [file join ${LEF_DIR} mem ${N_MEM(M0256)}.plef]
set LEF_LIST              [list ${LEF_TECH} ${LEF_STD_RVT} ${LEF_STD_LVT} ${LEF_MEM_M1024} ${LEF_MEM_M0256}]

# Files of tf
set TF_TECH               [file join ${TF_DIR} ${N_TECH(NAME)}.tf]
set TF_LIST               [list ${TF_TECH}]

# Files of lib
set LIB_STD_RVT_FF        [file join ${LIB_DIR} std ${N_STD(RVT)}_${N_STD(FF)}.lib]
set LIB_STD_RVT_SS        [file join ${LIB_DIR} std ${N_STD(RVT)}_${N_STD(SS)}.lib]
set LIB_STD_LVT_FF        [file join ${LIB_DIR} std ${N_STD(LVT)}_${N_STD(FF)}.lib]
set LIB_STD_LVT_SS        [file join ${LIB_DIR} std ${N_STD(LVT)}_${N_STD(SS)}.lib]
set LIB_MEM_M1024_FF      [file join ${LIB_DIR} mem ${N_MEM(M1024)}_${N_MEM(FF)}.lib]
set LIB_MEM_M1024_SS      [file join ${LIB_DIR} mem ${N_MEM(M1024)}_${N_MEM(SS)}.lib]
set LIB_MEM_M0256_FF      [file join ${LIB_DIR} mem ${N_MEM(M0256)}_${N_MEM(FF)}.lib]
set LIB_MEM_M0256_SS      [file join ${LIB_DIR} mem ${N_MEM(M0256)}_${N_MEM(SS)}.lib]
set LIB_LIST_FF           [list ${LIB_STD_RVT_FF} ${LIB_STD_LVT_FF} ${LIB_MEM_M1024_FF} ${LIB_MEM_M0256_FF}]
set LIB_LIST_SS           [list ${LIB_STD_RVT_SS} ${LIB_STD_LVT_SS} ${LIB_MEM_M1024_SS} ${LIB_MEM_M0256_SS}]
set LIB_LIST              [concat ${LIB_LIST_FF} ${LIB_LIST_SS}]

# Files of db
set DB_STD_RVT_FF         [file join ${DB_DIR} std ${N_STD(RVT)}_${N_STD(FF)}.db]
set DB_STD_RVT_SS         [file join ${DB_DIR} std ${N_STD(RVT)}_${N_STD(SS)}.db]
set DB_STD_LVT_FF         [file join ${DB_DIR} std ${N_STD(LVT)}_${N_STD(FF)}.db]
set DB_STD_LVT_SS         [file join ${DB_DIR} std ${N_STD(LVT)}_${N_STD(SS)}.db]
set DB_MEM_M1024_FF       [file join ${DB_DIR} mem ${N_MEM(M1024)}_${N_MEM(FF)}.db]
set DB_MEM_M1024_SS       [file join ${DB_DIR} mem ${N_MEM(M1024)}_${N_MEM(SS)}.db]
set DB_MEM_M0256_FF       [file join ${DB_DIR} mem ${N_MEM(M0256)}_${N_MEM(FF)}.db]
set DB_MEM_M0256_SS       [file join ${DB_DIR} mem ${N_MEM(M0256)}_${N_MEM(SS)}.db]
set DB_LIST_FF            [list ${DB_STD_RVT_FF} ${DB_STD_LVT_FF} ${DB_MEM_M1024_FF} ${DB_MEM_M0256_FF}]
set DB_LIST_SS            [list ${DB_STD_RVT_SS} ${DB_STD_LVT_SS} ${DB_MEM_M1024_SS} ${DB_MEM_M0256_SS}]
set DB_LIST               [concat ${DB_LIST_FF} ${DB_LIST_SS}]

# Files of qrc
set QRC_CCB               [file join ${QRC_DIR} ${N_QRC(CCB)} ${N_QRC(NAME)}]
set QRC_CCW               [file join ${QRC_DIR} ${N_QRC(CCW)} ${N_QRC(NAME)}]
set QRC_LIST              [list ${QRC_CCB} ${QRC_CCW}]

# Files of gds
set GDS_STD_RVT           [file join ${GDS_DIR} std ${N_STD(RVT)}.gds]
set GDS_STD_LVT           [file join ${GDS_DIR} std ${N_STD(LVT)}.gds]
set GDS_MEM_M1024         [file join ${GDS_DIR} mem ${N_MEM(M1024)}.gds]
set GDS_MEM_M0256         [file join ${GDS_DIR} mem ${N_MEM(M0256)}.gds]
set GDS_LIST              [list ${GDS_STD_RVT} ${GDS_STD_LVT} ${GDS_MEM_M1024} ${GDS_MEM_M0256}]

# Files of map
set MAP_FILE_CADEN        [file join ${MAP_DIR} ${N_MAP(CADEN)}.map]
set MAP_FILE_SYNOP        [file join ${MAP_DIR} ${N_MAP(SYNOP)}.map]

# Files of ndm
set NDM_STD_RVT           [file join ${NDM_DIR} std ${N_STD(RVT)}.ndm]
set NDM_STD_LVT           [file join ${NDM_DIR} std ${N_STD(LVT)}.ndm]
set NDM_MEM_M1024         [file join ${NDM_DIR} mem ${N_MEM(M1024)}.ndm]
set NDM_MEM_M0256         [file join ${NDM_DIR} mem ${N_MEM(M0256)}.ndm]
