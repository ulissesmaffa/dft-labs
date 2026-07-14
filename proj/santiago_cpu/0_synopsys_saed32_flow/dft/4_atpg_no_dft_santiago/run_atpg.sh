#!/bin/bash
set -euo pipefail

echo ">> Running TestMAX ATPG..."

mkdir -p out_data
module load tmatpg
TMAX=/tools/synopsys/tmatpg/txs/W-2024.09-SP5-5/bin/tmax
TMAX2=/tools/synopsys/tmatpg/txs/W-2024.09-SP5-5/bin/tmax2

$TMAX2 -shell ./scripts/top_atpg.tcl

echo ">> Done!"
