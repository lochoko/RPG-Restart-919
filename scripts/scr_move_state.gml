///scr_move_state
scr_get_input();
image_blend = c_white;

// Get the axis
var xaxis = (right_key - left_key);
var yaxis = (down_key - up_key);

var dir = point_direction(0, 0, xaxis, yaxis);

if (xaxis == 0 and yaxis == 0) {
    len = 0;
} else {
    len = spd;
}

hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

phy_position_x += hspd;
phy_position_y += vspd;

image_speed = sign(len) *.3;
if (len == 0) image_index = 0;

// Horizontal Sprites
if (hspd > 0){
    sprite_index = spr_player_right;
}
if (hspd < 0){
    sprite_index = spr_player_left;
}

// Vertical Sprites
if (vspd > 0) {
    sprite_index = spr_player_down;
}

if (vspd < 0) {
    sprite_index = spr_player_up;
}
