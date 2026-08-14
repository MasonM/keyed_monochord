.PHONY: all
all: render/monochord.stl render/box_test.svg render/monochord_lasercut_thick.svg render/monochord_lasercut_thin.svg

wall_th := 3
thick_th := 6

render/monochord.stl: monochord.scad
	openscad -q --enable import-function -o render/monochord.stl monochord.scad

render/box_test.svg: box_test.scad lasercut/lasercut.scad
	./lasercut/convert-2d.py -D wall_th=$(wall_th) -D x=40 -D y=40 -D z=40 box_test.scad render/box_test.svg

render/monochord_lasercut_thin.svg: monochord_lasercut.scad lasercut/lasercut.scad
	./lasercut/convert-2d.py -D wall_th=$(wall_th) -D thick_th=$(thick_th) -D generate_only=$(wall_th) monochord_lasercut.scad render/monochord_lasercut_thin.svg

render/monochord_lasercut_thick.svg: monochord_lasercut.scad lasercut/lasercut.scad
	./lasercut/convert-2d.py -D wall_th=$(wall_th) -D thick_th=$(thick_th) -D generate_only=$(thick_th) monochord_lasercut.scad render/monochord_lasercut_thick.svg

