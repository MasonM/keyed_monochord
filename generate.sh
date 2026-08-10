#!/bin/bash

set -euxo pipefail
PARAMS='-D inner_length=322 -D wall_th=3.1 -D hitchpin_block_th=6'
./lasercut/convert-2d.py $PARAMS -D generate_only=3.1 monochord_lasercut.scad render/monochord_lasercut_3mm.svg
./lasercut/convert-2d.py $PARAMS -D generate_only=6 monochord_lasercut.scad render/monochord_lasercut_6mm.svg
