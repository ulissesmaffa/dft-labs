################################################################################
# MMMC - Multi-Mode Multi-Corner
# Projeto: cpu_santiago  |  PDK: Cadence GPDK045 (gsclib045)
# A gsclib045 só tem corners slow e fast (sem typical)
################################################################################

create_library_set -name worst_libset -timing [list $STD_LIB_PATH/slow_vdd1v0_basicCells.lib]
create_library_set -name best_libset  -timing [list $STD_LIB_PATH/fast_vdd1v0_basicCells.lib]

# Timing conditions (operating conditions vêm do próprio .lib)
create_timing_condition -name worst_timing_cond -library_sets { worst_libset }
create_timing_condition -name best_timing_cond  -library_sets { best_libset }

# Delay corners - sem rc_corner no Genus (sem roteamento físico)
create_delay_corner -name worst_delay_corner -timing_condition worst_timing_cond
create_delay_corner -name best_delay_corner  -timing_condition best_timing_cond

# Constraint mode
create_constraint_mode -name func_mode -sdc_files [list $SCRIPTS_PATH/02_constraints.sdc]

# Analysis views
create_analysis_view -name worst_view -constraint_mode func_mode -delay_corner worst_delay_corner
create_analysis_view -name best_view  -constraint_mode func_mode -delay_corner best_delay_corner

# Setup=slow / Hold=fast
set_analysis_view -setup { worst_view } -hold { best_view }
