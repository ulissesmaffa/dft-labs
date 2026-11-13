# modo de teste a partir do assignfile e verificação das estruturas de scan
build_testmode \
   -testmode $TESTMODE \
   -assignfile $ASSIGNFILE

verify_test_structures \
   -testmode $TESTMODE
