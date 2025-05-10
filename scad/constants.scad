wall = 2;

tolerance = 0.1;
allowance = 0.1;
clearance = tolerance + allowance;

// phone
phone_x = 153;
phone_y = 14;
phone_z = 77;

// cradle
cradle_buffer = 1;
cradle_rounding = 2;
cradle_lip = 5;

cradle_x = phone_x + cradle_buffer * 2 + wall * 2;
cradle_y = phone_y + cradle_buffer * 2 + wall * 2;
cradle_z = phone_z + wall;

charger_x = wall * 2;
charger_z = 18.7;
charger_y = 7.3;
charger_r = wall;

wedge_angle_deg = 5;

// connection
connection_x = 30;
connection_y = 5;
connection_z = cradle_z;

// mount
phone_x_pos = 0;
phone_y_pos = 0;
phone_z_pos = 0;

// cd mount
cd_x = 120;
cd_y = 20;
cd_z = 3;
cd_r = 2;

cd_connection_angle = 0;

cd_prong_x = 20;
cd_prong_y = 20;
cd_prong_z = cd_z;
