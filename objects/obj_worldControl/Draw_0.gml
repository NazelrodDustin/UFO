/// @description Insert description here
// You can write your code in this editor

if (surface_exists(groundSurface)){
	var hh = window_get_height();
	shader_set(shd_unmovingPlaid);
	setup_plaid_texture(spr_groundTexture, 0);
	
	draw_surface(groundSurface, 0, hh * (3 / 4));
	shader_reset();
}else{
	var ww = window_get_width();
	var hh = window_get_height();
	var xx = ww / 2;
	var yy = (ww * 10);
	var steps = 512;
	var radius = ww * 10;
	var startOffset = floor(point_direction(xx, yy, ww, hh));
	var drawAmount = 180 - (startOffset * 2);
	show_debug_message(startOffset);
	show_debug_message(drawAmount);
	groundSurface = surface_create(ww, hh / 4);
	surface_set_target(groundSurface);
	draw_clear_alpha(c_black, 0);
	draw_primitive_begin(pr_trianglefan);
	draw_vertex(xx, yy);
	for(var i = 0; i <= steps; ++i){
		draw_vertex(xx + lengthdir_x(radius, startOffset + (drawAmount * i / steps)), yy + lengthdir_y(radius, startOffset + (drawAmount * i / steps)));
	}
	draw_primitive_end();
	surface_reset_target();
}
