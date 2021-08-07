/// @description Insert description here
// You can write your code in this editor

shader_set(shd_unmovingPlaid);
setup_plaid_texture(plaidTexture, 0);
	
draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, image_angle - 90), y - lengthdir_y(radius, image_angle - 90), 64 / sprite_get_width(sprite_index), 64 / sprite_get_width(sprite_index), image_angle, c_white, 1);
shader_reset();