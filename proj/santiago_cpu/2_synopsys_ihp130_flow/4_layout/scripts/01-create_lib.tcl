# =====================================================================
# ICC2 - Abertura da biblioteca e leitura do design
# (roda depois do source do icc2_setup.tcl)
# =====================================================================

# 1. cria a design lib referenciando os NDM (stdcell + iocell)
#create_lib ${TOP_MODULE_NAME}.dlib \
#    -technology $TECH_FILE \
#    -ref_libs [list $NDM_SC_LIB $NDM_IO_LIB]

#create_lib ${TOP_MODULE_NAME}.dlib \
#    -technology $TECH_FILE \
#    -ref_libs [list $NDM_SC_LIB $NDM_IO_LIB \
#                    /pdk/ihp/ihp130/ixc013g2_iocell/lef/ixc013g2_iocell_v5p8.lef]

create_lib ${TOP_MODULE_NAME}.dlib \
    -technology $TECH_FILE \
    -ref_libs [list $NDM_SC_LIB $NDM_IO_LIB \
                    /pdk/ihp/ihp130/ixc013g2ng_stdcell/lef/ixc013g2ng_tech.lef \
                    /pdk/ihp/ihp130/ixc013g2_iocell/lef/ixc013g2_iocell_v5p8.lef]


# 2. parasitics (DEPOIS da lib aberta). IHP: um unico .tlu+, sem layermap
#    (o mapeamento de camadas vem embutido no .tlu+ / .tf)
#read_parasitic_tech -tlup $TLUP_MAX -name maxTLU
#read_parasitic_tech -tlup $TLUP_MIN -name minTLU
read_parasitic_tech -tlup $TLUP_FILE -name rcTLU

# 3. netlist pos-sintese
read_verilog $PRE_LAYOUT_VER_NETLIST -top $TOP_MODULE_NAME
link_block

# 4. associa os corners de parasitics (late=max, early=min)
#set_parasitic_parameters -late_spec maxTLU -early_spec minTLU
set_parasitic_parameters -late_spec rcTLU -early_spec rcTLU

# 5. constraints
read_sdc $SDC_FILE

# 6. salva o bloco inicial
save_block -as ${TOP_MODULE_NAME}_initial
save_lib

# quantos pads e stdcells linkaram
#report_ref_libs
# checa se ha instancias nao resolvidas ou pinos soltos
#check_design -checks {netlist}
# confirma o clock
#report_clocks
