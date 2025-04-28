use <openscad-generics/generics.scad>
include <constants.scad>

$fn=100;

*left_arm();
*right_arm();
*bottom_arm();
*arm_pin_bottom();
arm_pin_top();

module connection_pin_cutout() {
	x_pos = arm_x / 2;
	y_pos = arm_connection_r;
	z_pos = 0;

	z_dim = arm_z;
	r_dim = arm_connection_pin_r + allowance;

	translate([x_pos, y_pos, z_pos]) cylinder(z_dim, r=r_dim);
}

module side_arm_gripper() {
	x_pos = arm_x / 2;
	y_pos = side_arm_y - gripper_r;
	z_pos = arm_z;

	stopper_z_pos = z_pos + gripper_z;
	stopper_r = gripper_r + wall;

	translate([x_pos, y_pos, z_pos]) cylinder(gripper_z, r=gripper_r);
	translate([x_pos, y_pos, stopper_z_pos]) cylinder(wall, r=stopper_r);
}

module side_arm() {
	difference () {
		union() {
			pill([arm_x, side_arm_y, arm_z], 0);
			side_arm_gripper();
		}

		connection_pin_cutout();
	}
}

module left_arm() {
	difference() {
		side_arm();

		// connection thinning
		thinning_x = arm_x;
		thinning_y = arm_x;
		thinning_z = arm_z * 2 / 3 + tolerance / 2;

		thinning_x_pos = 0;
		thinning_y_pos = 0;
		thinning_z_pos = arm_z / 3 - tolerance / 2;
		translate([thinning_x_pos, thinning_y_pos, thinning_z_pos]) cube([thinning_x, thinning_y, thinning_z]);
	}
}

module right_arm() {
	difference() {
		side_arm();

		// connection thinning
		thinning_x = arm_x;
		thinning_y = arm_x;
		thinning_z = arm_z * 2 / 3 + tolerance / 2;

		thinning_x_pos = 0;
		thinning_y_pos = 0;
		thinning_z_pos = 0;
		translate([thinning_x_pos, thinning_y_pos, thinning_z_pos]) cube([thinning_x, thinning_y, thinning_z]);
	}
}

module bottom_arm_gripper() {
	x_pos = 0;
	y_pos = bottom_arm_y;
	z_pos = 0;

	translate([x_pos, y_pos, z_pos]) union() {
		// square off arm
		translate([0, -arm_x, 0]) cube([arm_x, arm_x, arm_z]);

		cube([arm_x, wall, gripper_z + wall]);
		translate([0, - wall, gripper_z + wall]) cube([arm_x, wall * 2, wall]);
	}
}

module bottom_arm() {
	difference() {
		pill([arm_x, bottom_arm_y, arm_z], 0);

		// connection thinning
		thinning_x = arm_x;
		thinning_y = arm_x;
		thinning_z = arm_z / 3 + tolerance / 2;

		thinning_x_pos = 0;
		thinning_y_pos = 0;
		thinning_z_pos_list = [0, arm_z * 2 / 3 - tolerance / 2];
		
		for (thinning_z_pos = thinning_z_pos_list)
			translate([thinning_x_pos, thinning_y_pos, thinning_z_pos]) cube([thinning_x, thinning_y, thinning_z]);

		connection_pin_cutout();
	}

	bottom_arm_gripper();
}


// these are currently temporary. might want something better
module arm_pin_bottom() {
	difference() {
		union() {
			cylinder(pin_stopper_z, r=arm_connection_pin_r + wall);
			translate([0, 0, pin_stopper_z]) cylinder(arm_z, r=arm_connection_pin_r);
		}
		translate([0, 0, pin_stopper_z + arm_z / 2]) cylinder(arm_z / 2, r=arm_connection_pin_r / 2 + tolerance);
	}
}

module arm_pin_top() {
	cylinder(pin_stopper_z, r=arm_connection_pin_r + wall);
	translate([0, 0, pin_stopper_z]) cylinder(arm_z / 2, r=arm_connection_pin_r / 2);
}



