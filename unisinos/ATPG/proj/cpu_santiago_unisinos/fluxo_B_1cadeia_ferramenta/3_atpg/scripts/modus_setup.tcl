# library dir & path
set FLOW_ROOT           $FLOW_ROOT_SETUP
set STD_VLOG            $STD_VLOG_SETUP
set SCRIPTS_PATH        $FLOW_ROOT/3_atpg/scripts

# design setting
set TOP_MODULE_NAME top
set DESIGN cpu_santiago
set TESTMODE FULLSCAN

# input: arquivos gerados pelo Genus (write_dft_atpg) - nada escrito à mão
set MODUS_REF   $FLOW_ROOT/out_data/pre_layout/modus_ref
set NETLIST     $MODUS_REF/$TOP_MODULE_NAME.test_netlist.v
set ASSIGNFILE  $MODUS_REF/$TOP_MODULE_NAME.$TESTMODE.pinassign

# output dir
set ATPG_DIR        $FLOW_ROOT/out_data/atpg
set REPORT_DIR      $FLOW_ROOT/out_data/reports/atpg

file mkdir $ATPG_DIR
file mkdir $REPORT_DIR

set_db workdir ./
