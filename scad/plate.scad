MX_HOLE_SIZE = 14.5;
MX_PLATE_THICKNESS = 1.5;

include <points.scad>

module plate_holes(h) {
    for (i = points) {
        translate([i[1], i[2]])
        rotate([0, 0, i[0]])
        linear_extrude(h)
        square([MX_HOLE_SIZE, MX_HOLE_SIZE]);
    }
}

module plate() {
    difference() {
        minkowski() {
            hull() {
                plate_holes(0.5);
            }
            cylinder(r=4,h=1);
        }
        translate([0, 0, -5])
        plate_holes(10);
    }
}

plate();
