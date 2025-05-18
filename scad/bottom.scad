include <constants.scad>
include <common.scad>
include <top.scad>

GASKET_HEIGHT = 3;
CYL_HEIGHT = 1;
DELTA = GASKET_HEIGHT - CYL_HEIGHT;

module plate_form() {
    minkowski() {
        hull() {
            footprints(GASKET_HEIGHT - 1.5);
        }
        cylinder(r=4,h=1.5, $fn=64);
    }
}

module co_plate_form() {
    difference() {
        translate([0,0,0.75])
        cube([200,200,1.5],center=true);
        plate_form();
    }
}

module bottom_plate_form() {
    minkowski() {
        difference() {
            plate_form();
            scale([0.99,0.99,1])
            plate_form();
        }
        cylinder(r=3, h=1.5, $fn=64);
    }
}

module screwless_form() {
    intersection() {
        bottom_plate_form();
        plate_form();
    }
}

module screw_form() {
    difference() {
        intersection() {
            bottom_plate_form();
            plate_form();
        }

        screw_holes(h=GASKET_HEIGHT, $fn=64)
        circle(r=M3_HOLE_DIAM);
    }
    difference() {
        screw_holes(h=CYL_HEIGHT, $fn=64)
        circle(r=M3_HOLE_DIAM);

        screw_holes(h=GASKET_HEIGHT, $fn=64)
        circle(r=M3_HOLE_DIAM/2);
    }
}

module bottom_plate() {
    screw_form();

    DELTA_T = -120;

    translate([-DELTA_T, 0, 0])
    rotate([-90, 0, 0])
    rotate_extrude(angle=-8, convexity = 20) {
        translate([DELTA_T, 0, 0])
        projection()
        strut_positions(h=1.5, $fn=64)
        circle(r=M3_HOLE_DIAM/2-0.4);
    }

    translate([-DELTA_T, 0, 0])
    rotate([0,-8,0])
    translate([DELTA_T, 0, 0])
    screwless_form();
}

screw_form();

// bottom_plate_form();

