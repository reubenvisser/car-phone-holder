include <constants.scad>

use <openscad-generics/generics.scad>

cd_mount();

module cd_mount() {
	union() {
		#rounded_cube($fn=30, [cd_x, cd_y, cd_z], cd_r, sides_only=true);

		prong_x_pos_list = [0, cd_x - cd_prong_x];
		prong_y_pos = 0;
		prong_z_pos = 0;

		for(prong_x_pos = prong_x_pos_list)
			translate([prong_x_pos, prong_y_pos, prong_z_pos]) rounded_cube($fn=30, [cd_prong_x, cd_prong_y + cd_y, cd_prong_z], cd_r, sides_only=true);

		// connection
		connection_x_pos = cd_x / 2 - connection_x / 2 - wall + phone_x_pos;
		connection_y_pos = 0;
		connection_z_pos = cd_z;

		connection_male_z = connection_z + phone_z_pos;

		connection_shoulder_buffer = wall * 2;
		connection_shoulder_x = connection_x + connection_shoulder_buffer;
		connection_shoulder_y = connection_y;
		connection_shoulder_z = phone_z_pos;
		
		connection_shoulder_x_pos = connection_x_pos - connection_shoulder_buffer / 2;

		translate([connection_x_pos, connection_y_pos, connection_z_pos]) rotate([-cd_connection_angle, 0, 0]) cube([connection_x, connection_y, connection_male_z]);
		translate([connection_shoulder_x_pos, connection_y_pos, connection_z_pos]) rotate([-cd_connection_angle, 0, 0]) cube([connection_shoulder_x, connection_shoulder_y, connection_shoulder_z]);
	}
}
