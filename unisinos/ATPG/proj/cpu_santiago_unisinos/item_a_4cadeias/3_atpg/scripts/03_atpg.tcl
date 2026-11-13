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

# vetores em formato legível (um bloco por teste, com Scan_Load,
# pulso de clock e Scan_Unload)
catch {report_vectors -testmode $TESTMODE -experiment logic -format node \
          -outputfile $REPORT_DIR/vectors_node_logic.txt}

# copia os vetores gerados para out_data
file copy -force ./testresults $ATPG_DIR
