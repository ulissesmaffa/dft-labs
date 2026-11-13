# fault model (stuck-at apenas)
build_faultmodel \
   -includedynamic no

# geração de padrões
create_logic_tests \
   -testmode $TESTMODE \
   -experiment logic

# vetores em Verilog para simulação
write_vectors \
   -testmode $TESTMODE \
   -inexperiment logic \
   -language verilog \
   -scanformat parallel

# copia os vetores gerados para out_data
file copy -force ./testresults $ATPG_DIR
