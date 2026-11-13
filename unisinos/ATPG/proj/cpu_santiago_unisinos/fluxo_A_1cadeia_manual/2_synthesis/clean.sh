#!/bin/bash
ROOT_DIR=$(dirname "$(readlink -f "$0")")
rm -rf "$ROOT_DIR/.tmp" "$ROOT_DIR/../out_data/reports/syn" "$ROOT_DIR/../out_data/pre_layout"
