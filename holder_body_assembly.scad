include <constants.scad>
use <holder_body.scad>

module holder_body_assembly() {
	*translate([body_x, 0, body_z]) rotate([0, 180, 0]) body_front();
	body_back();
}

holder_body_assembly();
