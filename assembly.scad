include <constants.scad>

use <holder_body_assembly.scad>
use <arm_assembly.scad>

holder_body_assembly();
translate([body_x / 2, stopper_y_pos - arm_x / 2, body_z / 2 - arm_z / 2]) arm_assembly();
