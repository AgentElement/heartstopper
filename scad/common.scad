include <constants.scad>

module hole_with_delta(point, x, y) {
    key_delta = MX_KEY_SIZE / 2 + KEYDIFF + M3_HOLE_DIAM / 2;
    translate([points[point][1], points[point][2]])
    rotate([0, 0, points[point][0]])
    translate([x * key_delta, y * key_delta, 0])
    children();
}


module place_equidistant_along_line(p1, p2, n, ends=true) {
    x = p1[0] - p2[0];
    y = p1[1] - p2[1];
    theta = atan2(x, y);
    echo(theta);
    r = sqrt(pow(x, 2) + pow(y, 2));
    range = ends ? [0:n] : [1:n-1];
    for (i = range) {
        dx = sin(theta) * i / n * r;
        dy = cos(theta) * i / n * r;
        translate([p1[0] - dx, p1[1] - dy, 0])
        children();
    }
}


function get_offset(point, x, y) = [
    sin(45 - x * y * point[0]) * MX_KEY_SIZE / 2 * x + point[1],
    cos(45 - x * y * point[0]) * MX_KEY_SIZE / 2 * y + point[2],
];

module screw_holes(h) {
    key_delta = MX_KEY_SIZE / 2 + KEYDIFF + M3_HOLE_DIAM / 2;
    linear_extrude(h) {
        translate([
            points[5][1] + MX_KEY_SIZE / 2 - KEYDIFF - M3_HOLE_DIAM / 2,
            points[5][2] + key_delta,
        ])
        children();

        translate([
            points[11][1] - MX_KEY_SIZE / 2 + KEYDIFF + M3_HOLE_DIAM / 2, 
            points[11][2] + key_delta,
        ])
        children();

        translate([-1.4, 1, 0])
        translate([M3_HOLE_DIAM / 2 * sqrt(2), -M3_HOLE_DIAM / 2 * sqrt(2), 0])

        hole_with_delta(14, -1, 1)
        children();
        // hole_with_delta(11, 1, 0);
        hole_with_delta(2, -1, 0)
        children();
        // translate([M3_HOLE_DIAM / 2 * sqrt(2), M3_HOLE_DIAM / 2 * sqrt(2), 0])

        p1 = get_offset(points[12], 1, -1);
        p2 = get_offset(points[15], -1, -1);
        translate([0, 1, 0])
        place_equidistant_along_line(p1, p2, 5, ends=false)
        children();
    }
}

module strut_positions(h) {
    key_delta = MX_KEY_SIZE / 2 + KEYDIFF + M3_HOLE_DIAM / 2;
    linear_extrude(h) {
        translate([-1,3,0])
        translate([
            points[5][1] + MX_KEY_SIZE / 2 - KEYDIFF - M3_HOLE_DIAM / 2,
            points[5][2] + key_delta,
        ])
        children();

        translate([1,2.5,0])
        translate([
            points[11][1] - MX_KEY_SIZE / 2 + KEYDIFF + M3_HOLE_DIAM / 2, 
            points[11][2] + key_delta,
        ])
        children();

        translate([-0.5, 1.5, 0])
        translate([M3_HOLE_DIAM / 2 * sqrt(2), -M3_HOLE_DIAM / 2 * sqrt(2), 0])

        translate([1,2,0])
        hole_with_delta(14, -1, 1)
        children();
        // hole_with_delta(11, 1, 0);
        translate([-2.5, 2.5, 0])
        hole_with_delta(2, -1, 0)
        children();
        // translate([M3_HOLE_DIAM / 2 * sqrt(2), M3_HOLE_DIAM / 2 * sqrt(2), 0])

        p1 = get_offset(points[12], 1, -1);
        p2 = get_offset(points[15], -1, -1);
        translate([1.5, -2.5, 0])
        place_equidistant_along_line(p1, p2, 5, ends=false)
        children();
    }
}
