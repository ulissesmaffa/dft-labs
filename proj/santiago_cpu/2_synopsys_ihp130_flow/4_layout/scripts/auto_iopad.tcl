# ==============================================================================
# auto_iopad.tcl  --  Pad placement on the I/O ring (ICC2)
# Santiago CPU / IHP130. Deterministic spacing.
# Requires: initialize_floorplan and create_io_ring already done (02-floorplan).
# ==============================================================================

# ------------------------------------------------------------------------------
# 0. Geometric parameters (measured from the IHP130 library)
# ------------------------------------------------------------------------------
set die_width        2500     ;# must match initialize_floorplan
set corner_pad_size  310      ;# IHP corner size (310x310)
set corner_clearance 100      ;# design clearance after the corner
set pad_width        60       ;# IHP pad width (i16x/b16m = 60)

set exclusion_zone   [expr {$corner_pad_size + $corner_clearance}]
set available_space  [expr {$die_width - (2 * $exclusion_zone)}]

puts "Info: exclusion_zone=$exclusion_zone  available_space=$available_space"

# ------------------------------------------------------------------------------
# 1. Pad order per edge  (17 pads/side = 13 signal + 4 power)
#    ICC2 direction: left(up) top(->) right(down) bottom(<-)
# ------------------------------------------------------------------------------
set side_pads(left) {
    IOVDD_0
    PAD_CPU_RDY PAD_CLK PAD_RST
    PAD_DIN1_0 PAD_DIN1_1 PAD_DIN1_2 PAD_DIN1_3
    PAD_DIN1_4 PAD_DIN1_5 PAD_DIN1_6 PAD_DIN1_7
    PAD_CMDIN_0 PAD_CMDIN_1
    VDD_0 VSS_0 
    IOVSS_0
}
set side_pads(top) {
    IOVDD_1
    PAD_CMDIN_2 PAD_CMDIN_3 PAD_CMDIN_4 PAD_CMDIN_5 PAD_CMDIN_6
    PAD_DIN2_0 PAD_DIN2_1 PAD_DIN2_2 PAD_DIN2_3 PAD_DIN2_4 PAD_DIN2_5
    PAD_ZERO PAD_ERROR 
    IOVSS_1
}
set side_pads(right) {
    IOVDD_2
    PAD_DIN2_6 PAD_DIN2_7
    PAD_DIN3_0 PAD_DIN3_1 PAD_DIN3_2 PAD_DIN3_3
    PAD_DIN3_4 PAD_DIN3_5 PAD_DIN3_6 PAD_DIN3_7
    PAD_DOUT_HIGH_0 PAD_DOUT_HIGH_1 PAD_DOUT_HIGH_2
    VDD_2 VSS_2 
    IOVSS_2
}
set side_pads(bottom) {
    IOVDD_3
    PAD_DOUT_HIGH_3 PAD_DOUT_HIGH_4 PAD_DOUT_HIGH_5
    PAD_DOUT_HIGH_6 PAD_DOUT_HIGH_7
    PAD_DOUT_LOW_0 PAD_DOUT_LOW_1 PAD_DOUT_LOW_2 PAD_DOUT_LOW_3
    PAD_DOUT_LOW_4 PAD_DOUT_LOW_5 PAD_DOUT_LOW_6 PAD_DOUT_LOW_7
    IOVSS_3
}

# ------------------------------------------------------------------------------
# 2. Fixed spacing per edge (uniform, deterministic gap)
# ------------------------------------------------------------------------------
foreach side {left top right bottom} {
    set pads     $side_pads($side)
    set num_pads [llength $pads]

    set total_pad_width [expr {$num_pads * $pad_width}]
    set gap_space       [expr {$available_space - $total_pad_width}]

    if {$num_pads > 1} {
        set gap [expr {int(round(double($gap_space) / ($num_pads - 1)))}]
    } else {
        set gap 0
    }
    if {$gap_space < 0} {
        puts "WARNING: Edge $side overflows the available space (pads=$total_pad_width > $available_space)"
    }
    puts "Info: Edge $side -> $num_pads pads, gap=$gap um"

    set c [list]
    set first 1
    foreach p $pads {
        if {$first} {
            lappend c $p
            set first 0
        } else {
            lappend c $gap $p
        }
    }
    set_signal_io_constraints -io_guide_object "io_ring.$side" -constraint $c
}

# ------------------------------------------------------------------------------
# 3. Place the pads on the ring
# ------------------------------------------------------------------------------
puts "Info: Running place_io..."
place_io

# ------------------------------------------------------------------------------
# 4. Ring checks
# ------------------------------------------------------------------------------
check_io_placement -overlap all
check_io_placement -signal_constraints
puts "Info: Pad placement completed."
