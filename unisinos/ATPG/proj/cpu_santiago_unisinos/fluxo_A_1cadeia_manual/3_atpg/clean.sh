#!/bin/bash
ROOT_DIR=$(dirname "$(readlink -f "$0")")
rm -rf "$ROOT_DIR/.tmp" "$ROOT_DIR/.tmp_gui" "$ROOT_DIR/../out_data/reports/atpg" "$ROOT_DIR/../out_data/atpg"
