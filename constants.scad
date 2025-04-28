// general print settings
tolerance = 0.1;
clearance = 0.1;
allowance = tolerance + clearance;

wall = 2;

// body
body_x = 45;
body_y = 75;
body_r = 3;
body_z = body_r * 2 + 3 + allowance * 2;

// arms 
arm_z = 3;
arm_x = 10;

open_width = 95;

arm_connection_r = arm_x / 2;
arm_connection_pin_r = arm_connection_r / 2;
arm_connection_pin_z = 15;

gripper_r = 5;
gripper_z = 15;

side_arm_y = open_width / 2 + gripper_r * 2 + arm_connection_r;

bottom_arm_y = 50;

pin_stopper_z = 1;

// arm cutouts
side_arm_channel_x = body_x;
side_arm_channel_y = 15;
bottom_arm_channel_x = arm_x + allowance;
bottom_arm_channel_y = body_y / 2;

// bottom arm guide
guide_x = wall;
guide_y = 10;
guide_z = body_z - wall * 2 - allowance;
guide_spacing = arm_x + allowance * 2;

// side arm pivot
pivot_r = 2;
pivot_z = body_z - wall * 2 - allowance;
pivot_y_pos = body_y / 2 - side_arm_channel_y / 2 - pivot_r;

// top stopper
stopper_x = arm_x;
stopper_y = wall;
stopper_z = body_z - wall * 2 - allowance;
stopper_y_pos = pivot_y_pos + pivot_r + arm_x + allowance;
stopper_x_pos = body_x / 2 - arm_x / 2;

// connection
connection_z = body_z - body_r * 2;
