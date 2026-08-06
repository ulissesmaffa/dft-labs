#!/bin/bash
set -euo pipefail

echo ">> Running TestMAX Advisor..."

module load tmadvisor
sg_shell -tcl ./scripts/run_sg.tcl

echo ">> Done!"
