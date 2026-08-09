.PHONY: all
all: render/monochord.stl render/monochord_lasercut_flat.svg

render/monochord.stl: monochord.scad
	openscad --enable import-function -o render/monochord.stl monochord.scad
render/monochord_lasercut_flat.svg: monochord_lasercut.scad
	./lasercut/convert-2d.py monochord_lasercut.scad render/monochord_lasercut_flat.svg

