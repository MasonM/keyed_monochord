include <./lasercut/lasercut.scad>;

show_bottom_end = true;
show_top_end = true;
show_left_side = true;
show_right_side = true;
show_top_side = true;
show_bottom_side = true;
thickness = 3.2;
x = 25;
y = 25;
z = 50; 
num_fingers = 4;

function fj(start_up) = [
    [UP, start_up[0], num_fingers],
    [DOWN, start_up[1], num_fingers],
    [LEFT, start_up[2], num_fingers],
    [RIGHT, start_up[3], num_fingers],
];
translate([thickness,thickness,0]) {
    // Bottom end panel
    if (show_bottom_end) color("Gold",0.75) lasercutoutSquare(
        thickness=thickness, x=x-thickness*2, y=y-thickness*2,
        finger_joints = fj([1,1,1,0]),
        circles_remove=[[ 1.2, 10, 10 ]],
        simple_tabs=[
            [DOWN, -thickness/2, 0],
            [DOWN, -thickness/2, y-thickness],
            [RIGHT, x-thickness*2, -thickness/2],
        ],
    );
    // Top end panel
    if (show_top_end) color("blue",0.75) translate([0, 0, z-thickness]) lasercutoutSquare(
        thickness=thickness, x=x-thickness*2, y=y-thickness*2,
        finger_joints = fj([0,1,1,0]),
        circles_remove=[
            [1.15, 10, 10],
            [1.15, 10, 15],
        ],
        simple_tabs=[
            [DOWN, -thickness/2, 0],
            [RIGHT, x-thickness*2, -thickness/2],
        ],
    );
    // Left side panel
    if (show_left_side) color("red", 0.75) translate([0,0,thickness]) rotate([90,0,0]) lasercutoutSquare(
        thickness=thickness, x=x-thickness*2, y=z-thickness*2,
        finger_joints = fj([1,0,1,0]),
        circles_remove=[
            [1.1, 10, 10],
            [1.1, 10, 15],
            [1.1, 10, 20],
        ],
    );
    // Right side panel
    if (show_right_side) color("green", 0.75) translate([0,y-thickness,thickness]) rotate([90,0,0]) lasercutoutSquare(
        thickness=thickness, x=x-thickness*2, y=z-thickness*2,
        finger_joints = fj([1,1,1,0]),
        circles_remove=[
            [ 1.05, 10, 10 ],
            [ 1.05, 15, 10 ],
            [ 1.05, 10, 15 ],
            [ 1.05, 15, 15 ],
        ],
        simple_tabs=[
            [UP, -thickness/2, z-thickness*2],
            [DOWN, x-thickness*1.5, 0],
        ],
    );
    // Top side panel
    if (show_top_side) color("purple", 0.75) translate([0,0,thickness]) rotate([0,-90,0]) lasercutoutSquare(
        thickness=thickness, x=z-thickness*2, y=y-thickness*2,
        finger_joints = fj([0,1,0,1]),
        circles_remove=[
            [1.35, 10, 10],
            [1.35, 10, 15],
            [1.35, 15, 10],
            [1.35, 15, 15],
            [1.35, 20, 10],
        ],
    );
    // Bottom side panel
    if (show_bottom_side) color("brown", 0.75) translate([x-thickness,0,thickness]) rotate([0,-90,0]) lasercutoutSquare(
        thickness=thickness, x=z-thickness*2, y=y-thickness*2,
        finger_joints = fj([0,1,0,1]),
        circles_remove=[
            [1.3, 10, 10],
            [1.3, 10, 15],
            [1.3, 15, 10],
            [1.3, 15, 10],
            [1.3, 20, 10],
            [1.3, 20, 15],
        ],
        simple_tabs=[
            [UP, z-thickness*1.5, y-thickness*2],
        ],
    );
}