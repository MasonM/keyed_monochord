.PHONY: all
all: render/monochord.stl render/box_test.svg render/monochord_lasercut_thick.svg render/monochord_lasercut_thin.svg render/monochord_lasercut.lbrn2

wall_th := 3
thick_th := 6
inner_length := 322

render/monochord.stl: monochord.scad
	openscad -q --enable import-function -o render/monochord.stl monochord.scad

render/box_test.svg: box_test.scad lasercut/lasercut.scad
	./lasercut/convert-2d.py -D wall_th=$(wall_th) -D x=40 -D y=40 -D z=40 box_test.scad render/box_test.svg

render/monochord_lasercut_thin.svg: monochord_lasercut.scad lasercut/lasercut.scad pack_svg.py
	./lasercut/convert-2d.py -k -D inner_length=$(inner_length) -D wall_th=$(wall_th) -D thick_th=$(thick_th) -D generate_only=$(wall_th) monochord_lasercut.scad render/monochord_lasercut_thin.svg
	./pack_svg.py render/monochord_lasercut_thin.svg

render/monochord_lasercut_thick.svg: monochord_lasercut.scad lasercut/lasercut.scad pack_svg.py
	./lasercut/convert-2d.py -k -D inner_length=$(inner_length) -D wall_th=$(wall_th) -D thick_th=$(thick_th) -D generate_only=$(thick_th) monochord_lasercut.scad render/monochord_lasercut_thick.svg
	./pack_svg.py render/monochord_lasercut_thick.svg

render/monochord_lasercut.lbrn2: render/monochord_lasercut_thin.svg render/monochord_lasercut_thick.svg make_lbrn2.py
	./make_lbrn2.py render/monochord_lasercut_thin.svg render/monochord_lasercut_thick.svg render/monochord_lasercut.lbrn2

