/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 2, c_white, 1);
draw_circle(x, y, sprite_get_yoffset(sprite_index) - sprite_get_height(sprite_index), true);