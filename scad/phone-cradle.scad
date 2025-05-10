include <constants.scad>

use <openscad-generics/transformations.scad>
use <openscad-generics/generics.scad>

phone_cradle();

module rotate_about(a, v) {
	translate(v) rotate(a) translate(-v) children();
}

module phone_cradle() {
	difference() {
		// connection
		connection_x_pos = cradle_x / 2 - connection_x / 2 - wall;
		connection_y_pos = cradle_y;
		connection_z_pos = 0;

		hull() {
			rounded_cube($fn=40, [cradle_x, cradle_y, cradle_z], r_dim=cradle_rounding);

			// connection extension
			rotate_about(a=[0, 0, -wedge_angle_deg], v=[cradle_x, cradle_y, 0]){
				translate([connection_x_pos, connection_y_pos, connection_z_pos]) rounded_cube($fn=40, [connection_x + wall * 2, connection_y + wall, cradle_z], r_dim=cradle_rounding);
			}
		}

		// connection cutout
		rotate_about(a=[0, 0, -wedge_angle_deg], v=[cradle_x, cradle_y, 0]){
			translate([connection_x_pos + wall - clearance, connection_y_pos - clearance, connection_z_pos]) cube([connection_x + clearance * 2, connection_y + clearance * 2, cradle_z]);
		}

		// phone cutout
		translate([wall, wall, wall]) rounded_cube($fn=40, [cradle_x - wall * 2, cradle_y - wall * 2, cradle_z], r_dim=cradle_rounding);

		// front cutout
		lip_x_pos = wall + cradle_lip;
		lip_y_pos = 0;
		lip_z_pos = wall + cradle_lip;

		lip_x = cradle_x - wall * 2 - cradle_lip * 2;
		lip_y = cradle_y - wall;
		lip_z = cradle_z - wall - cradle_lip;
		translate([lip_x_pos, lip_y_pos, lip_z_pos]) cube([lip_x, lip_y, lip_z]);

		charger_x_pos_list = [0, cradle_x - wall];
		charger_y_pos = cradle_y / 2 - charger_y / 2;
		charger_z_pos = cradle_z / 2 - charger_z / 2;

		for (charger_x_pos  = charger_x_pos_list ) {
			charger_x_pos = charger_x_pos -  charger_x / 4;
			translate([charger_x_pos, charger_y_pos, charger_z_pos]) rounded_cube($fn=30, [charger_x, charger_y, charger_z], 1);
		}
	}
}


