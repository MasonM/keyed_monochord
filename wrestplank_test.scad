include <./lasercut/lasercut.scad>;

wall_th = 3.2;
thick_th = 6.2;
inner_length = 322;
inner_width = inner_length * (3/14);
height = inner_width / 2;
lower_bottom_board_th = wall_th;
inner_bottom_z = lower_bottom_board_th/*+ upper_bottom_board_th*/;
hitchpin_block_height = (height - inner_bottom_z) * (3/4);
wrestplank_th = 9.02;
// Wrestplank height (?)
wrestplank_height = hitchpin_block_height;
// Wrestplank position (?) In this file the case interior spans
// [0, inner_length] x [0, inner_width] (walls sit outside), so no wall_th
// offsets here.
wrestplank_pos = [
    inner_length - wrestplank_th,
    0,
    inner_bottom_z
];
key_depth = inner_width * (2/7);
nat_height = thick_th;
kb_pos = [
    wall_th + inner_length * (1/6),
    -key_depth,
    key_depth - wall_th
];
tangent_height = 10;
tangent_top_string_clearance = wall_th / 10;
bridge_height = height * (5/14);
soundboard_height = wall_th;
soundboard_pos = [
    0,
    // Rear edge sits against the back wall's inner face
    inner_width,
    // Keep the string (soundboard + bridge + string) just above the tangent
    kb_pos.z + nat_height + tangent_height + tangent_top_string_clearance - (bridge_height + soundboard_height)
];

lasercutoutSquare(
    thickness=wrestplank_th,
    x=wrestplank_height,
    y=inner_width,
    circles_remove=[
        [4.699, 10, 10], // #13
        [5.055, 10, 25], // #8
        [5.220, 10, 40], // #5
        [5.309, 10, 55], // #4
    ],
    simple_tabs = [
        // Right tabs connecting to front panel
        [
            RIGHT,
            0,
            -wall_th/2,
            [wall_th, height / 8, wrestplank_th],
        ],
        [
            RIGHT,
            height / 4,
            -wall_th/2,
            [wall_th, height / 8, wrestplank_th],
        ],
        // Left tabs connecting to back panel
        [
            RIGHT,
            -wall_th,
            inner_width + wall_th / 2,
            [wall_th, wall_th, wrestplank_th],
        ],
        [
            RIGHT,
            height / 8,
            inner_width + wall_th / 2,
            [wall_th, height / 8, wrestplank_th],
        ],
    ],
    finger_joints=[
        [LEFT, 0, 4, [wall_th, wrestplank_th]],
    ],
);