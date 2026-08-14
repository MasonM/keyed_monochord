include <./lasercut/lasercut.scad>;

show_bottom_end = true;
show_top_end = true;
show_left_side = true;
show_right_side = true;
show_top_side = true;
show_bottom_side = true;
wall_th = 6.1;
x = 20;
y = 20;
z = 20; 
num_fingers = 4;

function fj(start_up) = [
    [UP, start_up[0], num_fingers],
    [DOWN, start_up[1], num_fingers],
    [LEFT, start_up[2], num_fingers],
    [RIGHT, start_up[3], num_fingers],
];
translate([wall_th,wall_th,0]) {
    // Bottom end panel
    if (show_bottom_end) color("Gold",0.75) lasercutoutSquare(
        thickness=wall_th, x=x-wall_th*2, y=y-wall_th*2,
        finger_joints = fj([1,1,1,0]),
        circles_remove=[[ 1, 4, 4 ]],
        simple_tabs=[
            [DOWN, -wall_th/2, 0],
            [DOWN, -wall_th/2, y-wall_th],
            [RIGHT, x-wall_th*2, -wall_th/2],
        ],
    );
    // Top end panel
    if (show_top_end) color("blue",0.75) translate([0, 0, z-wall_th]) lasercutoutSquare(
        thickness=wall_th, x=x-wall_th*2, y=y-wall_th*2,
        finger_joints = fj([0,1,1,0]),
        circles_remove=[
            [1, 4, 4],
            [1, 4, 8],
        ],
        simple_tabs=[
            [DOWN, -wall_th/2, 0],
            [RIGHT, x-wall_th*2, -wall_th/2],
        ],
    );
    // Left side panel
    if (show_left_side) color("red", 0.75) translate([0,0,wall_th]) rotate([90,0,0]) lasercutoutSquare(
        thickness=wall_th, x=x-wall_th*2, y=z-wall_th*2,
        finger_joints = fj([1,0,1,0]),
        circles_remove=[
            [1, 4, 4],
            [1, 8, 4],
            [1, 4, 8],
        ],
    );
    // Right side panel
    if (show_right_side) color("green", 0.75) translate([0,y-wall_th,wall_th]) rotate([90,0,0]) lasercutoutSquare(
        thickness=wall_th, x=x-wall_th*2, y=z-wall_th*2,
        finger_joints = fj([1,1,1,0]),
        circles_remove=[
            [ 1, 4, 4 ],
            [ 1, 8, 4 ],
            [ 1, 4, 8 ],
            [ 1, 8, 8 ],
        ],
        simple_tabs=[
            [UP, -wall_th/2, z-wall_th*2],
            [DOWN, x-wall_th*1.5, 0],
        ],
    );
    // Top side panel
    if (show_top_side) color("purple", 0.75) translate([0,0,wall_th]) rotate([0,-90,0]) lasercutoutSquare(
        thickness=wall_th, x=z-wall_th*2, y=y-wall_th*2,
        finger_joints = fj([0,1,0,1]),
        circles_remove=[
            [1, 4, 4],
            [1, 8, 4],
            [1, 4, 8],
            [1, 8, 8],
            [1, 6, 11],
        ],
    );
    // Bottom side panel
    if (show_bottom_side) color("brown", 0.75) translate([x-wall_th,0,wall_th]) rotate([0,-90,0]) lasercutoutSquare(
        thickness=wall_th, x=z-wall_th*2, y=y-wall_th*2,
        finger_joints = fj([0,1,0,1]),
        circles_remove=[
            [1, 3, 3],
            [1, 7, 3],
            [1, 11, 3],
            [1, 3, 7],
            [1, 7, 7],
            [1, 11, 7],
        ],
        simple_tabs=[
            [UP, z-wall_th*1.5, y-wall_th*2],
        ],
    );
}
