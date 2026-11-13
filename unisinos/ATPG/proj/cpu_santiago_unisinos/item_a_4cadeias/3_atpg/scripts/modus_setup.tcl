# library dir & path
set FLOW_ROOT           $FLOW_ROOT_SETUP
set STD_VLOG            $STD_VLOG_SETUP
set SCRIPTS_PATH        $FLOW_ROOT/3_atpg/scripts

# design setting
set TOP_MODULE_NAME top
set DESIGN cpu_santiago
set TESTMODE FULLSCAN

# input: netlist com scan gerada pela síntese
set PRE_LAYOUT_DIR  $FLOW_ROOT/out_data/pre_layout
set NETLIST         $PRE_LAYOUT_DIR/$DESIGN.v
set ASSIGNFILE      $SCRIPTS_PATH/$DESIGN.assignfile

# output dir
set ATPG_DIR        $FLOW_ROOT/out_data/atpg
set REPORT_DIR      $FLOW_ROOT/out_data/reports/atpg

file mkdir $ATPG_DIR
file mkdir $REPORT_DIR

set_db workdir ./
