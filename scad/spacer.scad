include <constants.scad>
include <common.scad>


difference() {
    cylinder(h=3.5, r=M3_HOLE_DIAM, $fn=64);
    cylinder(h=3.5, r=M3_HOLE_DIAM/2, $fn=64);
}
