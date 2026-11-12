######################################################
## ATPG passo a passo
## Batch: ./atpg/run_modus.sh
## GUI  : ./atpg/run_modus_gui.sh e rodar UM bloco de cada vez no console
## Valores esperados entre colchetes: c01_redundant
######################################################

# 0. variáveis (netlist de inp_data/source, PDK, testmode)
source ../../scripts/vars.tcl

# 1. Build Model -> conferir o resumo [5 PIs, 1 PO, 5 células, 0 flops]
build_model -designsource $NETLIST -techlib $STD_VLOG -designtop top

# 2. Build Test Mode -> sem pinos de teste: modo só PI -> PO
if {[file exists $ASSIGNFILE]} {
    build_testmode -testmode $TESTMODE -assignfile $ASSIGNFILE
} else {
    build_testmode -testmode $TESTMODE
}

# 3. Verify Test Structures -> [0 cadeias de scan]
verify_test_structures -testmode $TESTMODE

# 4. Build Fault Model -> [42 falhas, 22 colapsadas]
build_faultmodel -includedynamic no

# 5. Create Tests -> [5 padrões, 35 testadas, 7 redundantes]
create_logic_tests -testmode $TESTMODE -experiment logic -effort high

# 6. Lista de falhas -> classes de equivalência e status
report_faults -testmode $TESTMODE -experiment logic -faultstatus all -faultlocation cellpin

# 7. Write Vectors -> [11 ciclos]
write_vectors -testmode $TESTMODE -inexperiment logic -language verilog
