#!/bin/bash

set -euxo pipefail
PARAMS='-D inner_length=322 -D wall_th=3.1 -D hitchpin_block_th=6.1'
./lasercut/convert-2d.py $PARAMS -D generate_only=3.1 monochord_lasercut.scad render/monochord_lasercut_3mm.svg
./lasercut/convert-2d.py $PARAMS -D generate_only=6.1 monochord_lasercut.scad render/monochord_lasercut_6mm.svg
./lasercut/convert-2d.py -D wall_th=6 -D x=40 -D y=40 -D z=40 box_test.scad render/box_test.svg
