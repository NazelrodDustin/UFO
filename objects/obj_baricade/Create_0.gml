/// @description Insert description here
// You can write your code in this editor
event_inherited();

x = round(window_get_width() / 2);
y = 1000 + (window_get_height() * .75);//round((window_get_width() * 10) + (window_get_height() * .75));

healthAmt = 100;
image_angle = 0;


show_debug_message(sprite_get_xoffset(sprite_index));
show_debug_message(sprite_get_yoffset(sprite_index));
show_debug_message(x);
show_debug_message(y);