#!/usr/bin/env bash

set -eou pipefail

#kitty @ ls | ./kitty-convert-dump.py > session.conf
CFG_DIR="${HOME}/.config/kitty/kitty-control/ttys3"

kitty @ ls | ${CFG_DIR}/kitty-convert-dump.py > ${CFG_DIR}/session.conf

echo "kitty session dumped"

echo; read -r -p "Press Enter to exit"; echo ""

