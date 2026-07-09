# library dir & path
set PRJ_ROOT            $PRJ_ROOT_SETUP
set FLOW_ROOT           $FLOW_ROOT_SETUP
set IO_LIB_PATH	        $IO_LIB_PATH_SETUP
set STD_LIB_PATH        $STD_LIB_PATH_SETUP
set SOURCE_PATH         $FLOW_ROOT/inp_data/rtl

# search path for all files
# set search_path         "$search_path . $STD_LIB_PATH $IO_LIB_PATH $SOURCE_PATH"
set_app_var search_path [concat $search_path "." $STD_LIB_PATH $IO_LIB_PATH $SOURCE_PATH]

# library settings
set synthetic_library   "dw_foundation.sldb"
set target_library      $STD_LIB_PATH/sky130_fd_sc_hd__ss_100C_1v60.db
set iopad_library	    [list \
    $IO_LIB_PATH/sky130_fd_io__top_gpiov2_ss_ss_100C_1v60_1v65.db          \
    $IO_LIB_PATH/sky130_fd_io__top_power_lvc_wpad_ss_100C_1v60_1v65_1v65.db \
]
# set link_library        "* $target_library $synthetic_library $iopad_library"
set_app_var link_library   [concat "*" $target_library $synthetic_library $iopad_library] 

# min/max (BC-WC): each lib max (slow) gets its version min (fast)
set_min_library $STD_LIB_PATH/sky130_fd_sc_hd__ss_100C_1v60.db \
    -min_version $STD_LIB_PATH/sky130_fd_sc_hd__ff_n40C_1v95.db

set_min_library $IO_LIB_PATH/sky130_fd_io__top_gpiov2_ss_ss_100C_1v60_1v65.db \
    -min_version $IO_LIB_PATH/sky130_fd_io__top_gpiov2_ff_ff_n40C_1v95_5v50.db

set_min_library $IO_LIB_PATH/sky130_fd_io__top_power_lvc_wpad_ss_100C_1v60_1v65_1v65.db \
    -min_version $IO_LIB_PATH/sky130_fd_io__top_power_lvc_wpad_ff_n40C_1v95_5v50_5v50.db

# design setting
# set TOP_MODULE_NAME top
set WIDTH 8
set RTL_TOP         "top"
set TOP_MODULE_NAME "top_WIDTH${WIDTH}"

set DESIGN santiago_cpu

#UM: Fix register autoremoval
#set_app_var compile_seqmap_propagate_constants false
set_app_var compile_seqmap_propagate_high_effort false

# output dir
set PRE_LAYOUT_DIR	$FLOW_ROOT/out_data/pre_layout
set REPORT_DIR  	$FLOW_ROOT/out_data/reports/syn

file mkdir $PRE_LAYOUT_DIR
file mkdir $REPORT_DIR