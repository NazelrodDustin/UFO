/// @description Insert description here
// You can write your code in this editor

shader_set(shd_unmovingPlaid);
setup_plaid_texture(plaidTexture, 0);

draw_sprite_ext(sprite_index, image_index, -ww * 2 - lengthdir_x(radius, p1AngleToDraw - 90), y - lengthdir_y(radius, p1AngleToDraw - 90), image_xscale * scale, scale, p1AngleToDraw, c_white, 1);
draw_sprite_ext(sprite_index, image_index, ww * 2 - lengthdir_x(radius, p2AngleToDraw - 90), y - lengthdir_y(radius, p2AngleToDraw - 90), image_xscale * scale, scale, p2AngleToDraw, c_white, 1);

shader_reset();