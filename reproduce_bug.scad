projection(cut = false) {

  translate([0, 22.08, 0])
  union() {
    linear_extrude(height = 3, center = false)
      polygon(points=[[0, 0], [10, 0], [10, 22.0857], [0, 22.0857], [0, 0]]);
    translate([0, 22.0857,0]) cube([3,3,3]);
  }
}
