/// @description Insert description here
// You can write your code in this editor

shader_set(shd_unmovingPlaid);
setup_plaid_texture(plaidTexture, 0);

var scale = widthTarget / sprite_get_width(sprite_index);

draw_sprite_ext(sprite_index, image_index, -ww * 2 - lengthdir_x(radius, image_angle - 90), y - lengthdir_y(radius, image_angle - 90), image_xscale * scale, scale, image_angle, c_white, 1);
draw_sprite_ext(sprite_index, image_index, ww * 2 - lengthdir_x(radius, image_angle - 90), y - lengthdir_y(radius, image_angle - 90), image_xscale * scale, scale, image_angle, c_white, 1);

shader_reset();