##################################################
## library dir & path
##################################################
set FLOW_ROOT           $FLOW_ROOT_SETUP
set PDK_PATH            $PDK_PATH_SETUP
set STD_LIB_PATH        $STD_LIB_PATH_SETUP
set LEF_PATH            $LEF_PATH_SETUP
set STD_VLOG            $STD_VLOG_SETUP
set SOURCE_PATH         [file normalize $FLOW_ROOT/../inp_data/source/rtl]
set SCRIPTS_PATH        $FLOW_ROOT/2_synthesis/scripts

set LEF_LIST {
    gsclib045_tech.lef
    gsclib045_macro.lef
}

##################################################
## design setting
##################################################
set TOP_MODULE_NAME top
set DESIGN cpu_santiago

set SYN_EFF medium
set MAP_EFF medium
set OPT_EFF medium

##################################################
## output dir
##################################################
set PRE_LAYOUT_DIR  $FLOW_ROOT/out_data/pre_layout
set REPORT_DIR      $FLOW_ROOT/out_data/reports/syn

file mkdir $PRE_LAYOUT_DIR
file mkdir $REPORT_DIR

##################################################
## Atributos gerais
##################################################
set_db information_level                  9    ;# verbosidade máxima
set_db hdl_track_filename_row_col         true ;# arquivo/linha/coluna nas mensagens de HDL
set_db lp_power_unit                      mW   ;# unidade dos relatórios de potência
set_db error_on_lib_lef_pin_inconsistency true ;# erro se pinos do .lib e do LEF divergirem
set_db auto_ungroup                       none ;# preserva hierarquia do RTL
set_db lp_insert_clock_gating             false

set_db syn_generic_effort                 $SYN_EFF
set_db syn_map_effort                     $MAP_EFF
set_db syn_opt_effort                     $OPT_EFF

##################################################
## Search paths
##################################################
set_db init_lib_search_path "$STD_LIB_PATH $LEF_PATH"
set_db init_hdl_search_path $SOURCE_PATH
