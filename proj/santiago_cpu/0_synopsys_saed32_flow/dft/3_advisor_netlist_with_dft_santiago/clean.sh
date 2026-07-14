#!/bin/bash
set -uo pipefail
cd "$(dirname "$0")"

echo ">> cleaning: $(pwd)"
rm -rf out_data/* *.log *.prj

echo ">> Done!"
