#!/usr/bin/env python3
"""
Generate a LightBurn .lbrn2 project from the thin and thick lasercut SVGs.

Each closed subpath in the input SVGs becomes a Path shape, assigned to a
layer named "Thin" or "Thick" with the cut settings embedded below.

Usage: make_lbrn2.py thin.svg thick.svg output.lbrn2
"""

import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'lasercut'))
from pack_svg import parse_subpaths

HEADER = '''\
<?xml version="1.0" encoding="UTF-8"?>
<LightBurnProject AppVersion="2.1.03" DeviceName="Seattle Makers" FormatVersion="1" MaterialHeight="0" MirrorX="True" MirrorY="True" AskForSendName="True">
    <CutSetting type="Cut">
        <index Value="0"/>
        <name Value="Thin"/>
        <minPower Value="80"/>
        <maxPower Value="85"/>
        <maxPower2 Value="20"/>
        <speed Value="50"/>
        <kerf Value="0.1"/>
        <dotTime Value="1"/>
        <priority Value="0"/>
        <tabCount Value="1"/>
        <tabCountMax Value="1"/>
    </CutSetting>
    <CutSetting type="Cut">
        <index Value="1"/>
        <name Value="Thick"/>
        <minPower Value="75"/>
        <maxPower Value="80"/>
        <maxPower2 Value="20"/>
        <speed Value="20"/>
        <kerf Value="0.1"/>
        <dotTime Value="1"/>
        <priority Value="1"/>
        <doOutput Value="0"/>
        <tabCount Value="1"/>
        <tabCountMax Value="1"/>
    </CutSetting>
'''

FOOTER = '''\
    <Notes ShowOnLoad="0" Notes=""/>
</LightBurnProject>
'''

THIN_CUT_INDEX = 0
THICK_CUT_INDEX = 1


def fmt(v):
    return f"{v:.5f}".rstrip('0').rstrip('.')


def svg_shapes(svg_path: str, cut_index: int, next_id: int) -> tuple:
    """Return (xml, next_id) with one Path shape per SVG subpath."""
    with open(svg_path) as f:
        svg = f.read()
    m = re.search(r'<path d="(.*?)"', svg, re.S)
    if not m:
        sys.exit(f"No <path> found in {svg_path}")
    out = []
    for sp in parse_subpaths(m.group(1)):
        verts = "".join(f"V{fmt(x)} {fmt(y)}c0x1c1x1" for x, y in sp)
        out.append(
            f'    <Shape Type="Path" CutIndex="{cut_index}" '
            f'VertID="{next_id}" PrimID="{next_id}">\n'
            '        <XForm>1 0 0 1 0 0</XForm>\n'
            f'        <VertList>{verts}</VertList>\n'
            '        <PrimList>LineClosed</PrimList>\n'
            '    </Shape>\n')
        next_id += 1
    return "".join(out), next_id


def main():
    if len(sys.argv) != 4:
        sys.exit("Usage: make_lbrn2.py thin.svg thick.svg output.lbrn2")
    thin_svg, thick_svg, output_path = sys.argv[1:]

    shapes_thin, next_id = svg_shapes(thin_svg, THIN_CUT_INDEX, 1)
    shapes_thick, _ = svg_shapes(thick_svg, THICK_CUT_INDEX, next_id)

    with open(output_path, 'w') as f:
        f.write(HEADER + shapes_thin + shapes_thick + FOOTER)


if __name__ == '__main__':
    main()
