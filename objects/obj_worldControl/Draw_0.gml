/// @description Insert description here
// You can write your code in this editor

if (surface_exists(groundSurface)){
	draw_surface(groundSurface, 0, 720 / 2);	
}else{
	groundSurface = surface_create(1280, 720 / 2);
	surface_set_target(groundSurface);
	var steps = 64;
	var xx = window_get_width() / 2;
	var yy = 4000;
	var radius = window_get_width() * 3;
	var startOffset = 67.5;
	var drawAmount = 45;
	draw_primitive_begin(pr_trianglefan);
	draw_vertex(xx, yy);
	for(var i = 0; i <= steps; ++i;)
		{
		draw_vertex(xx + lengthdir_x(radius, startOffset + (drawAmount * i / steps)), yy + lengthdir_y(radius, startOffset + (drawAmount * i / steps)));
		}
	draw_primitive_end();
	surface_reset_target();
}
