#!/bin/bash
set -euo pipefail

ROOT_DIR=$(dirname "$(readlink -f "$0")")
TMP_DIR="$ROOT_DIR/.tmp"
SCRIPTS_DIR="$ROOT_DIR/scripts"

export ROOT_DIR

mkdir -p "$TMP_DIR"

module load vcs verdi designcompiler syn

echo "=== Running Synthesis ==="
cd "$TMP_DIR"
dc_shell -f "$SCRIPTS_DIR/dc_top.tcl" 2>&1 | tee -i syn.log
echo "=== Done ==="
