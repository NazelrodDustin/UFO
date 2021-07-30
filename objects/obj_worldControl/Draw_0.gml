/// @description Insert description here
// You can write your code in this editor

if (surface_exists(groundSurface)){
	shader_set(shd_unmovingPlaid);
	setup_plaid_texture(spr_groundtexture);
	
	draw_surface(groundSurface, 0, 720 / 2);
	shader_reset();
}else{
	show_debug_message("Recreating Surface");
	groundSurface = surface_create(1280, 720 / 2);
	surface_set_target(groundSurface);
	draw_clear_alpha(c_black, 0);
	var steps = 256;
	var xx = window_get_width() / 2;
	var yy = 4000;
	var radius = window_get_width() * 3;
	var startOffset = 67.5;
	var drawAmount = 45;
	draw_primitive_begin(pr_trianglefan);
	draw_vertex(xx, yy);
	for(var i = 0; i <= steps; ++i){
		draw_vertex(xx + lengthdir_x(radius, startOffset + (drawAmount * i / steps)), yy + lengthdir_y(radius, startOffset + (drawAmount * i / steps)));
	}
	draw_primitive_end();
	surface_reset_target();
}
