# modelo do design a partir da netlist com scan + modelos Verilog das células
build_model \
   -cell $TOP_MODULE_NAME \
   -source $NETLIST \
   -techlib $STD_VLOG \
   -allowmissingmodules no \
   -blackboxoutputs x
