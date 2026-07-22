# top design
set TOP_MODULE_NAME "top_santiago_cpu_pad"
set DESIGN          "santiago_cpu"

# dirs
set PRJ_ROOT        $PRJ_ROOT_SETUP
set FLOW_ROOT       $FLOW_ROOT_SETUP

set SOURCE_DIR  	"$FLOW_ROOT/inp_data/rtl"           
set REPORT_DIR  	"$FLOW_ROOT/out_data/reports/pnr"   
set PRE_LAYOUT_DIR	"$FLOW_ROOT/out_data/pre_layout"    
set POST_LAYOUT_DIR	"$FLOW_ROOT/out_data/post_layout"   

set SYN_TECH_DIR	 $SYN_TECH_DIR_SETUP                
set STD_CELL_LIB_DIR $STD_LIB_PATH_SETUP                
set IO_CELL_LIB_DIR	 $IO_LIB_PATH_SETUP                 

set PRE_LAYOUT_VER_NETLIST  "$PRE_LAYOUT_DIR/${DESIGN}.v"   
set PRE_LAYOUT_DDC_NETLIST  "$PRE_LAYOUT_DIR/${DESIGN}.ddc" 
set SDC_FILE                "$PRE_LAYOUT_DIR/${DESIGN}.sdc" 

set POST_LAYOUT_VER_NETLIST "$POST_LAYOUT_DIR/${DESIGN}_final.v"   
set SPEF_FILE               "$POST_LAYOUT_DIR/${DESIGN}_final.spef"
set SDF_FILE                "$POST_LAYOUT_DIR/${DESIGN}_final.sdf" 

# set ANTENNA_RULE_FILE    "./scripts/antenna_rules.tcl"

# NDM reference (stdcell only, no PADs for now) 
set NDM_SC_LIB   "$STD_CELL_LIB_DIR/ndm/saed32rvt_base_frame_timing.ndm"
set NDM_IO_LIB   "$FLOW_ROOT/_lc/libs/saed32io_wb_5v"

# tech
set TECH_FILE    "$SYN_TECH_DIR/tf/saed32nm_1p9m.tf"

# parasitics paths (consumed AFTER lib is open, in the flow script) 
set TLUP_MAP  "$SYN_TECH_DIR/starrc/saed32nm_tf_itf_tluplus.map"
set TLUP_MAX  "$SYN_TECH_DIR/starrc/max/saed32nm_1p9m_Cmax.tluplus"
set TLUP_MIN  "$SYN_TECH_DIR/starrc/min/saed32nm_1p9m_Cmin.tluplus"

# --- power/ground nets (core + IO ring) ---
set PWR_NET    "VDD"
set GND_NET    "VSS"
set IOPWR_NET  "VDDIO"
set IOGND_NET  "VSSIO"

# fillers / antenna (stdcell)
set METAL_FILLER "SHFILL128_RVT SHFILL64_RVT SHFILL3_RVT SHFILL2_RVT SHFILL1_RVT"
set FILLER       "SHFILL1_RVT"
set ANTENNA_CELL "ANTENNA_RVT"




############################################################
# # top design name
# set TOP_MODULE_NAME "top_santiago_cpu"                  

# # data directory
# set SOURCE_DIR  	"$FLOW_ROOT/inp_data/rtl"           
# set REPORT_DIR  	"$FLOW_ROOT/out_data/reports/pnr"   
# set PRE_LAYOUT_DIR	"$FLOW_ROOT/out_data/pre_layout"    
# set POST_LAYOUT_DIR	"$FLOW_ROOT/out_data/post_layout"   

# set SYN_TECH_DIR	 $SYN_TECH_DIR_SETUP                
# set STD_CELL_LIB_DIR $STD_LIB_PATH_SETUP                
# set IO_CELL_LIB_DIR	 $IO_LIB_PATH_SETUP                 

# # set ANTENNA_RULE_FILE    "./scripts/antenna_rules.tcl"

# set PRE_LAYOUT_VER_NETLIST  "$PRE_LAYOUT_DIR/${TOP_MODULE_NAME}_mapped.v"   
# set PRE_LAYOUT_DDC_NETLIST  "$PRE_LAYOUT_DIR/${TOP_MODULE_NAME}_mapped.ddc" 
# set SDC_FILE                "$PRE_LAYOUT_DIR/${TOP_MODULE_NAME}_mapped.sdc" 

# set POST_LAYOUT_VER_NETLIST "$POST_LAYOUT_DIR/${TOP_MODULE_NAME}_final.v"   
# set SPEF_FILE               "$POST_LAYOUT_DIR/${TOP_MODULE_NAME}_final.spef"
# set SDF_FILE                "$POST_LAYOUT_DIR/${TOP_MODULE_NAME}_final.sdf" 

# # # ICC reports
# # set ICC_MAX_TIMING_RPT   "$REPORT_DIR/icc_timing_max.rpt"
# # set ICC_MIN_TIMING_RPT   "$REPORT_DIR/icc_timing_min.rpt"
# # set ICC_QOR_RPT          "$REPORT_DIR/icc_qor.rpt"
# # set ICC_CONSTRAINTS_RPT  "$REPORT_DIR/icc_constraints.rpt"

# # Library lookup paths (.db / .sldb)
# set SC_LIB_PATH          "$STD_CELL_LIB_DIR/db_nldm"                    
# set IO_LIB_PATH          "$IO_CELL_LIB_DIR/db_nldm"                     
# set search_path          "$search_path . $SC_LIB_PATH $IO_LIB_PATH"     

# # Library settings (consistent with 2_synthesis)
# set synthetic_library    "dw_foundation.sldb"                                   
# set target_library       $SC_LIB_PATH/saed32rvt_ss0p75v125c.db                  
# set iopad_library	     $IO_LIB_PATH/saed32io_fc_ss0p95v125c_2p25v.db          
# set link_library         "* $target_library $synthetic_library $iopad_library"  

# set_min_library $SC_LIB_PATH/saed32rvt_ss0p75v125c.db \
#     -min_version $SC_LIB_PATH/saed32rvt_ff0p95v25c.db   

# set_min_library $IO_LIB_PATH/saed32io_fc_ss0p95v125c_2p25v.db \
#     -min_version $IO_LIB_PATH/saed32io_fc_ff1p16vn40c_2p75v.db  

# # Milkyway design (to use in ICC1)
# # set ICC_MW_LIB  santiago_cpu.mw
# # set MW_SC_LIB   "$STD_CELL_LIB_DIR/milkyway/saed32nm_rvt_1p9m"  
# # set MW_IO_LIB   "$IO_CELL_LIB_DIR/milkyway/saed32_io_fc"        

# # NDM (ICC2)


# set TECH_FILE   "$SYN_TECH_DIR/tf/saed32nm_1p9m.tf"                    
# set TLUP_MAP    "$SYN_TECH_DIR/starrc/saed32nm_tf_itf_tluplus.map"     
# set TLUP_MAX    "$SYN_TECH_DIR/starrc/max/saed32nm_1p9m_Cmax.tluplus"  
# set TLUP_MIN    "$SYN_TECH_DIR/starrc/min/saed32nm_1p9m_Cmin.tluplus"  

# # Power & ground nets (core)
# set MW_POWER_NET     "VDD"
# set MW_POWER_PORT    "VDD"
# set MW_GROUND_NET    "VSS"
# set MW_GROUND_PORT   "VSS"

# # I/O ring power & ground
# set MW_IOPOWER_NET   "VDDIO"
# set MW_IOPOWER_PORT  "VDDIO"
# set MW_IOGROUND_NET  "VSSIO"
# set MW_IOGROUND_PORT "VSSIO"

# set mw_logic1_net ${MW_POWER_NET}
# set mw_logic0_net ${MW_GROUND_NET}

# # Filler / antenna cell names
# set METAL_FILLER  "SHFILL128_RVT SHFILL64_RVT SHFILL3_RVT SHFILL2_RVT"
# set FILLER        "SHFILL1_RVT"
# set ANTENNA_CELL  "ANTENNA_RVT"
# set PAD_FILLER    "FILLER50 FILLER40 FILLER35 FILLER20 FILLER15 FILLER10 FILLER5 FILLER1 FILLER01"

# set STD_CELL_LIB_GDS "$STD_CELL_LIB_DIR/gds/saed32nm_rvt_oa.gds"
# set IO_CELL_LIB_GDS  "$IO_CELL_LIB_DIR/gds/saed32_stdio_fc.gds"
