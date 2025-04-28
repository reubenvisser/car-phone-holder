include <constants.scad>
use <arms.scad>

module arm_assembly () {
	translate([arm_x / 2, -arm_x / 2, 0]) rotate([0, 0, 90]) left_arm();
	translate([-arm_x / 2, arm_x / 2, 0]) rotate([0, 0, 270]) right_arm();
	translate([arm_x / 2, arm_x / 2, 0]) rotate([0, 0, 180]) bottom_arm();
}

arm_assembly();
