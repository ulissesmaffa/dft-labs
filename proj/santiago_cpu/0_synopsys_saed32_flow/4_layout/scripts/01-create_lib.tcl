# ICC2
create_lib ${TOP_MODULE_NAME}.dlib -tech $TECH_FILE \
    -ref_libs "$NDM_SC_LIB $NDM_IO_LIB"

read_parasitic_tech -layermap $TLUP_MAP -tlup $TLUP_MAX -name maxTLU
read_parasitic_tech -layermap $TLUP_MAP -tlup $TLUP_MIN -name minTLU

read_verilog $PRE_LAYOUT_VER_NETLIST -top $TOP_MODULE_NAME
link_block

set_parasitic_parameters -late_spec maxTLU -early_spec minTLU

read_sdc $SDC_FILE
save_block -as ${TOP_MODULE_NAME}_initial

# ICC1
# # Library Creation, TLU+, verilog and DEF import
# file delete -force $ICC_MW_LIB 

# create_mw_lib $ICC_MW_LIB \
# 	-technology $TECH_FILE \
# 	-mw_reference_library "$MW_SC_LIB $MW_IO_LIB" \
# 	-open

# set_tlu_plus_files \
# 	-max_tluplus $TLUP_MAX \
# 	-min_tluplus $TLUP_MIN \
# 	-tech2itf_map  $TLUP_MAP
# check_tlu_plus_files

# # read in design 
# import_designs $PRE_LAYOUT_VER_NETLIST \
# 	-format verilog \
# 	-cel $TOP_MODULE_NAME  \
# 	-top $TOP_MODULE_NAME 
	
# # check library
# check_library
# check_tlu_plus_files
# list_libs

# #save milkyway library
# save_mw_cel -as ${TOP_MODULE_NAME}_initial

# #read in constraint file
# read_sdc $SDC_FILE 
