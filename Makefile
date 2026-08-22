.PHONY: all
all: render/monochord.stl render/box_test.svg render/wrestplank_test.svg render/monochord_lasercut_thick.svg render/monochord_lasercut_thin.svg render/monochord_lasercut_wrestplank.svg render/monochord_lasercut.lbrn2

wall_th := 3
thick_th := 6
wrestplank_th := 9
inner_length := 322

params = -D inner_length=$(inner_length) -D wall_th=$(wall_th) -D thick_th=$(thick_th) -D wrestplank_th=$(wrestplank_th)
convert_2d = ./lasercut/convert-2d.py --pack -k $(1) $(2) $(3)

render/monochord.stl: monochord.scad
	openscad -q --enable import-function -o render/monochord.stl monochord.scad

render/box_test.svg: box_test.scad lasercut/lasercut.scad
	$(call convert_2d, -D wall_th=$(wall_th) -D x=40 -D y=40 -D z=40, $<, $@)

render/wrestplank_test.svg: wrestplank_test.scad lasercut/lasercut.scad
	$(call convert_2d, $(params), $<, $@)

render/monochord_lasercut_thin.svg: monochord_lasercut.scad lasercut/lasercut.scad lasercut/convert-2d.py lasercut/pack_svg.py
	$(call convert_2d, $(params) -D generate_only=$(wall_th), $<, $@)

render/monochord_lasercut_thick.svg: monochord_lasercut.scad lasercut/lasercut.scad lasercut/convert-2d.py lasercut/pack_svg.py
	$(call convert_2d, $(params) -D generate_only=$(thick_th), $<, $@)

render/monochord_lasercut_wrestplank.svg: monochord_lasercut.scad lasercut/lasercut.scad lasercut/convert-2d.py lasercut/pack_svg.py
	$(call convert_2d, $(params) -D generate_only=$(wrestplank_th), $<, $@)

render/monochord_lasercut.lbrn2: render/monochord_lasercut_thin.svg render/monochord_lasercut_thick.svg make_lbrn2.py
	./make_lbrn2.py render/monochord_lasercut_thin.svg render/monochord_lasercut_thick.svg $@

