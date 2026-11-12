######################################################
## Variáveis do ATPG (passo 0)
## Rodar a partir de atpg/.tmp/{batch,gui}
## O circuito é o único .v em inp_data/source/
######################################################
source ../../../_setup/setup.tcl

set FLOW_ROOT $FLOW_ROOT_SETUP
set STD_VLOG  $STD_VLOG_SETUP
set TESTMODE  FULLSCAN

set NETLIST [glob -nocomplain $FLOW_ROOT/inp_data/source/*.v]
if {[llength $NETLIST] != 1} {
    error "inp_data/source/ deve ter exatamente um .v (encontrado: [llength $NETLIST])"
}
set NETLIST [lindex $NETLIST 0]

# circuitos com flop precisam de um .assignfile (clock, reset, scan)
set ASSIGNFILE [file rootname $NETLIST].assignfile

set_db workdir ./

puts "NETLIST  = $NETLIST"
puts "STD_VLOG = $STD_VLOG"
