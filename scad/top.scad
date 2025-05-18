include <points.scad>
include <constants.scad>
include <common.scad>

KEYDIFF = (MX_KEY_SIZE - MX_HOLE_SIZE) / 2;


module plate_holes() {
    for (i = points) {
        translate([i[1], i[2]])
        rotate([0, 0, i[0]])
        square([MX_HOLE_SIZE, MX_HOLE_SIZE], center=true);
    }
}

module plate_struts() {
    screw_holes(h=5, $fn=64)
    difference() {
        circle(r=M3_HOLE_DIAM-0.5);
        circle(r=M3_HOLE_DIAM/2);
    }
}


kbx = -KB2040_W - MX_KEY_SIZE / 2 - KEYDIFF;
kby = -KB2040_H / 2 + MX_KEY_SIZE / 2;
module holes(h) {
    linear_extrude(h) {
        plate_holes();

        translate([kbx, kby - (KB2040_SH - KB2040_H) / 2])
        square([KB2040_SW, KB2040_SH]);
        translate([kbx + KB2040_W - KB2040_SW, kby - (KB2040_SH - KB2040_H) / 2])
        square([KB2040_SW, KB2040_SH]);
    }
}

module footprints(h) {
    linear_extrude(h) {
        plate_holes();
        translate([kbx, kby])
        square([KB2040_W, KB2040_H]);
    }
}

// module dxf1() {
//    import("../build/dxf/demo.dxf");
// }

// module dxf2() {
//    import("../build/dxf/demo2.dxf");
// }


module outline() {
    difference() {
        minkowski() {
            hull() {
                footprints(0.5);
            }

            cylinder(r=4,h=1, $fn=64);
        }
        translate([0, 0, -5])
        screw_holes(h=10, $fn=64)
        children();
    }
}

module plate() {
    difference() {
        outline()
        circle(r=M3_HOLE_DIAM/2);
        translate([0, 0, -5])
        holes(10, $fn=64);
    }
    plate_struts();
}

module sketch_pcb() {
    difference() {
        projection()
        outline()
        square([M3_HOLE_DIAM / 2, M3_HOLE_DIAM/2]);
        square([MX_KEY_SIZE / 2, MX_KEY_SIZE / 2]);
    }
}

module boundary() {
    difference() {
        projection()
        outline();
    }
}

plate();

