#!/bin/bash
set -euo pipefail

echo ">> Running TestMAX Advisor..."

module load tmadvisor
sg_shell -tcl ./scripts/top_advisor.tcl

echo ">> Done!"
