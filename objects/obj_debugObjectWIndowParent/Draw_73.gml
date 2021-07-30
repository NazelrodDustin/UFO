if (drawRectangleAroundInstance || instance_exists(debugWindowId)){
	//draw_rectangle_color(x - spriteWidthAdd - (spriteWidth), y - spriteHeightAdd - (spriteHeight), x + spriteWidth + spriteWidthAdd, y + spriteHeight + spriteHeightAdd, c_red, c_red, c_red, c_red, true); 
	//draw_rectangle_color(x - spriteWidthAdd - (spriteWidth / 8), y - spriteHeightAdd - (spriteHeight / 8), x + spriteWidth + spriteWidthAdd + (spriteWidth / 8), y + spriteHeight + spriteHeightAdd + (spriteHeight / 8), c_red, c_red, c_red, c_red, true);
	draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_red, .5);
	draw_text_color(x - (string_width(string(id)) / 2), y - abs(sprite_height), string(id), c_white, c_white, c_white, c_white, 1);
	
	draw_point_color(x, y, c_white);
}