/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor\

if (surface_exists(groundSurface)){
	draw_surface(groundSurface, (-ww * 2) - (ww / 2), hh * (3 / 4));
	draw_surface(groundSurface, (ww * 2) - (ww / 2), hh * (3 / 4));
}else{
	var xx = ww / 2;
	var yy = (ww * 10);
	var steps = 512;
	var radius = ww * 10;
	var startOffset = floor(point_direction(xx, yy, ww, hh));
	var drawAmount = 180 - (startOffset * 2);
	var tempGroundSurface = surface_create(ww, (hh / 4) + 5);
	surface_set_target(tempGroundSurface);
	draw_clear_alpha(c_black, 0);
	
	draw_set_color(c_black);
	draw_primitive_begin(pr_trianglefan);
	draw_vertex(xx, yy);
	for(var i = 0; i <= steps; ++i){
		draw_vertex(xx + lengthdir_x(radius, startOffset + (drawAmount * i / steps)), yy + lengthdir_y(radius, startOffset + (drawAmount * i / steps)));
	}
	draw_primitive_end();
	draw_set_color(c_white);
	
	draw_primitive_begin(pr_trianglefan);
	draw_vertex(xx, yy);
	for(var i = 0; i <= steps; ++i){
		draw_vertex(xx + lengthdir_x(radius - 3, startOffset + (drawAmount * i / steps)), yy + lengthdir_y(radius - 3, startOffset + (drawAmount * i / steps)));
	}
	draw_primitive_end();
	surface_reset_target();
	
	groundSurface = surface_create(ww, (hh / 4) + 5);
	surface_set_target(groundSurface);
	shader_set(shd_unmovingPlaid);
	setup_plaid_texture(spr_groundTexture, 0);
	
	draw_surface(tempGroundSurface, 0, 0);
	shader_reset();
	surface_reset_target();
	surface_free(tempGroundSurface);
}