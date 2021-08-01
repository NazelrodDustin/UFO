/// @description Insert description here
// You can write your code in this editor

y-=1;
sprite_set_offset(sprite_index, sprite_get_width(sprite_index) / 2, sprite_get_yoffset(sprite_index) - 1);
show_debug_message(y);
