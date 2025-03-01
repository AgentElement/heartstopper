include <constants.scad>
include <common.scad>
include <pcb.scad>


module top_baseplate() {
    difference() {
        minkowski() {
            hull() {
                footprints(0.5);
            }

            cylinder(r=4,h=1, $fn=64);
        }
        translate([0, 0, -5])
        screw_holes(h=10, $fn=64)
        circle(r=M3_HOLE_DIAM/2);
    }
}

top_baseplate();
