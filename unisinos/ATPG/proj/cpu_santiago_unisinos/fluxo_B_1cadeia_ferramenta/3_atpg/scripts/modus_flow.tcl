######################################################
## Fluxo B - ATPG com os arquivos gerados pelo Genus
## Build Model -> Build Test Mode -> Verify Test Structures ->
## Build Fault Model -> Create Tests -> Write Vectors
######################################################

# 1. modelo do design: netlist com scan + modelos Verilog das células
build_model \
   -designsource $NETLIST \
   -techlib $STD_VLOG \
   -designtop $TOP_MODULE_NAME

# 2. modo de teste a partir do pinassign gerado pelo Genus
build_testmode \
   -testmode $TESTMODE \
   -assignfile $ASSIGNFILE

# 3. verificação e relatório das estruturas de teste (cadeias, clocks)
verify_test_structures \
   -testmode $TESTMODE

report_test_structures \
   -testmode $TESTMODE \
   -reportscanchain all

# 4. modelo de falhas (stuck-at apenas)
build_faultmodel \
   -includedynamic no

# 5. testes: o create_logic_tests gera o teste da cadeia e os de lógica
create_logic_tests \
   -testmode $TESTMODE \
   -experiment logic

# 6. vetores em Verilog para simulação
write_vectors \
   -testmode $TESTMODE \
   -inexperiment logic \
   -language verilog \
   -scanformat parallel

# copia os vetores gerados para out_data
file copy -force ./testresults $ATPG_DIR
