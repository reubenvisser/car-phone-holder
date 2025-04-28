use <openscad-generics/generics.scad>
include <constants.scad>

$fn=100;

body_back();
*body_front();

// guide
guide_y_pos = wall + 5;

module holder_body() {
	difference() {
		union() {
			difference() {
				pill([body_x, body_y, body_z], body_r);
				translate([wall, wall, wall]) pill([body_x - wall * 2, body_y - wall * 2, body_z - wall * 2], 1);
			}
		}

		// side arm channel
		side_arm_channel_x_pos = 0;
		side_arm_channel_y_pos = body_y / 2 - side_arm_channel_y / 2;
		side_arm_channel_z_pos = body_z / 2 - arm_z / 2 - allowance;
		translate([side_arm_channel_x_pos, side_arm_channel_y_pos, side_arm_channel_z_pos]) cube([side_arm_channel_x, side_arm_channel_y, arm_z + allowance * 2]);

		// bottom arm channel
		bottom_arm_channel_x_pos = body_x / 2 - bottom_arm_channel_x / 2;
		bottom_arm_channel_y_pos = 0;
		bottom_arm_channel_z_pos = body_z / 2 - arm_z / 2 - allowance;
		translate([bottom_arm_channel_x_pos, bottom_arm_channel_y_pos, bottom_arm_channel_z_pos]) cube([bottom_arm_channel_x, bottom_arm_channel_y, arm_z + allowance * 2]);
	}
}

module body_back() {
	// shell
	difference() {
		holder_body();
		cut_x_pos = 0;
		cut_y_pos = 0;
		cut_z_pos = body_z / 2 + connection_z / 2 - tolerance / 2;
		translate([0, 0, cut_z_pos]) cube([body_x, body_y, body_z / 2]);

		// connection cutout
		connection_x = body_x - wall + allowance;
		connection_y = body_y - wall + allowance;

		connection_x_pos = wall / 2 - allowance / 2;
		connection_y_pos = wall / 2 - allowance / 2;
		connection_z_pos = body_r;

		translate([connection_x_pos, connection_y_pos, connection_z_pos]) pill([connection_x, connection_y, connection_z], 0);
	}


	// bottom arm guide
	guide_x_pos = 0;
	guide_z_pos = 0;
	translate([body_x / 2 - bottom_arm_channel_x / 2 - wall, guide_y_pos, wall]) cube([guide_x, guide_y, body_z - wall *2]);
	translate([body_x / 2 + bottom_arm_channel_x / 2, guide_y_pos, wall]) cube([guide_x, guide_y, guide_z]);
	translate([body_x / 2 - bottom_arm_channel_x / 2, guide_y_pos, 0]) cube([guide_spacing, guide_y, body_z / 2 - arm_z / 2]);

	// side arm pivots
	pivot_x_pos_list = [body_x * (1/8), body_x * (7/8)];
	for (pivot_x_pos = pivot_x_pos_list) {
		translate([pivot_x_pos, pivot_y_pos, wall]) cylinder(pivot_z, r=pivot_r);
	}

	// stopper top
	translate([stopper_x_pos, stopper_y_pos, wall]) cube([stopper_x, stopper_y, stopper_z]);
}

module body_front() {
	translate([body_x, 0, body_z]) rotate([0, 180, 0]) union() {
		difference() {
			intersection() {
				holder_body();
				cut_x_pos = 0;
				cut_y_pos = 0;
				cut_z_pos = body_z / 2 - connection_z / 2 + tolerance / 2;
				translate([cut_x_pos, cut_y_pos, cut_z_pos]) cube([body_x, body_y, body_z]);

			}

			// connection cutout
			connection_x = body_x - wall - allowance;
			connection_y = body_y - wall - allowance;

			connection_x_pos = wall / 2 + allowance / 2;
			connection_y_pos = wall / 2 + allowance / 2;
			connection_z_pos = body_r;
			difference() {
				translate([-0.1, -0.1, body_r]) pill([body_x + 0.2, body_y + 0.2, connection_z], 0);
				translate([connection_x_pos, connection_y_pos, connection_z_pos]) pill([connection_x, connection_y, connection_z], 0);
			}
		}

		// bottom arm guide
		translate([body_x / 2 - guide_spacing / 2 + allowance, guide_y_pos, body_z / 2 + arm_z / 2]) cube([guide_spacing - allowance * 2, guide_y, body_z / 2 - arm_z / 2]);
	}
}
