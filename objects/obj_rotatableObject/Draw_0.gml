/// @description Insert description here
// You can write your code in this editor

shader_set(shd_unmovingPlaid);
setup_plaid_texture(spr_metalTexture, 0);
	
draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, image_angle - 90), y - lengthdir_y(radius, image_angle - 90), 1, 1, image_angle, c_white, 1);
shader_reset();
image_angle += 0.00125;