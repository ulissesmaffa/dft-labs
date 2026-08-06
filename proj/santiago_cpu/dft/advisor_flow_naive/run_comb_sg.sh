#!/bin/bash
set -euo pipefail

module load tmadvisor
sg_shell -tcl ./scripts/run_comb.tcl
