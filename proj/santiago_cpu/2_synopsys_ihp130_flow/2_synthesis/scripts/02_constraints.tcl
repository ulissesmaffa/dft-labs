# ============================================================
# 02_constraints.tcl - Santiago CPU / IHP130 (core 1.2V)
# ============================================================

# --- Design Constraints ---
set CLK_PORT                 clk
set CLOCK_PERIOD             10      ;# 100 MHz
set CLOCK_UNCERTAINTY_SETUP  1
set CLOCK_LATENCY            1
set CLOCK_TRANSITION         0.2
set INPUT_DELAY              0.1
set OUTPUT_DELAY             0.1
set OUTPUT_LOAD              10
set INPUT_TRANSITION         0.2

# --- Coleções ---
set ALL_IN_BUT_CLK [remove_from_collection [all_inputs] [get_ports $CLK_PORT]]
set ALL_OUT        [all_outputs]

# --- Clock ---
create_clock -period $CLOCK_PERIOD -name MY_CLK [get_ports $CLK_PORT]
set_clock_uncertainty -setup $CLOCK_UNCERTAINTY_SETUP [get_clocks MY_CLK]
set_clock_latency     $CLOCK_LATENCY     [get_clocks MY_CLK]
set_clock_transition  $CLOCK_TRANSITION  [get_clocks MY_CLK]

# --- I/O timing ---
set_input_delay  $INPUT_DELAY  -clock MY_CLK $ALL_IN_BUT_CLK
set_output_delay $OUTPUT_DELAY -clock MY_CLK $ALL_OUT

set_load             $OUTPUT_LOAD      $ALL_OUT
set_input_transition $INPUT_TRANSITION $ALL_IN_BUT_CLK

# --- Proteção das células de I/O instanciadas explicitamente ---
# AJUSTAR os padrões conforme a nomenclatura real do top_santiago_cpu_pad
foreach pat {PAD_* CORNER* VDD_* VSS_* IOVDD_* IOVSS_*} {
    set c [get_cells -quiet $pat]
    if {[sizeof_collection $c] > 0} {
        set_dont_touch $c
    } else {
        puts "INFO: nenhuma celula casou com '$pat'"
    }
}

# min/max já vem do set_min_library no dc_setup.tcl
# NÃO replicar set_operating_conditions aqui.
