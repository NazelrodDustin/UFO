/// @description Insert description here
// You can write your code in this editor

if (surface_exists(p1Surf) && surface_exists(p2Surf)){
	
	surface_set_target(p1Surf);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();
	
	surface_set_target(p2Surf);
	draw_clear_alpha(c_black, 0);
	surface_reset_target();

	shader_set(shd_unmovingPlaid);

	/*for(var i = 0; i < instance_number(obj_ufo); i++){
		var drawObject = instance_find(obj_ufo, i);
	
		draw_sprite_ext(drawObject.sprite_index, drawObject.image_index, drawObject.xx - lengthdir_x(drawObject.radius, drawObject.p1AngleToDraw - 90), drawObject.yy - lengthdir_y(drawObject.radius, drawObject.p1AngleToDraw - 90), drawObject.image_xscale * drawObject.scale, drawObject.scale, drawObject.p1AngleToDraw, c_white, drawObject.image_alpha);
		draw_sprite_ext(drawObject.sprite_index, drawObject.image_index, drawObject.xx - lengthdir_x(drawObject.radius, drawObject.p2AngleToDraw - 90), drawObject.yy - lengthdir_y(drawObject.radius, drawObject.p2AngleToDraw - 90), drawObject.image_xscale * drawObject.scale, drawObject.scale, drawObject.p2AngleToDraw, c_white, drawObject.image_alpha);
	}

	for(var i = 0; i < instance_number(obj_tower); i++){
		var drawObject = instance_find(obj_tower, i);
	
		draw_sprite_ext(drawObject.sprite_index, drawObject.image_index, drawObject.xx - lengthdir_x(drawObject.radius, drawObject.p1AngleToDraw - 90), drawObject.yy - lengthdir_y(drawObject.radius, drawObject.p1AngleToDraw - 90), drawObject.image_xscale * drawObject.scale, drawObject.scale, drawObject.p1AngleToDraw, c_white, drawObject.image_alpha);
		draw_sprite_ext(drawObject.sprite_index, drawObject.image_index, drawObject.xx - lengthdir_x(drawObject.radius, drawObject.p2AngleToDraw - 90), drawObject.yy - lengthdir_y(drawObject.radius, drawObject.p2AngleToDraw - 90), drawObject.image_xscale * drawObject.scale, drawObject.scale, drawObject.p2AngleToDraw, c_white, drawObject.image_alpha);
	}*/
	
	
	
	surface_set_target(p1Surf);
	setup_plaid_texture(spr_metalTexture, 0);
	
	with(obj_barricade){
		//if (inP1Cam){
			draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p1AngleToDraw - 90), y - lengthdir_y(radius, p1AngleToDraw - 90), image_xscale * scale, scale, p1AngleToDraw, c_white, image_alpha);	
		//}
	}
	
	setup_plaid_texture(spr_zombieSkinTexture, 0);
	
	with(obj_zombie){
		//if (inP1Cam){
			draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p1AngleToDraw - 90), y - lengthdir_y(radius, p1AngleToDraw - 90), image_xscale * scale, scale, p1AngleToDraw, c_white, image_alpha);	
		//}
	}
	
	setup_plaid_texture(spr_skinTexture, 0);
	
	with(obj_player){
		//if (inP1Cam){
			draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p1AngleToDraw - 90), y - lengthdir_y(radius, p1AngleToDraw - 90), image_xscale * scale, scale, p1AngleToDraw, c_white, image_alpha);	
		//}
	}
	surface_reset_target();
	
	surface_set_target(p2Surf);
	setup_plaid_texture(spr_metalTexture, 0);
	
	with(obj_barricade){
		//if (inP2Cam){
			draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p2AngleToDraw - 90), y - lengthdir_y(radius, p2AngleToDraw - 90), image_xscale * scale, scale, p2AngleToDraw, c_white, image_alpha);	
		//}
	}
	
	setup_plaid_texture(spr_zombieSkinTexture, 0);
	
	with(obj_zombie){
		//if (inP2Cam){
			draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p2AngleToDraw - 90), y - lengthdir_y(radius, p2AngleToDraw - 90), image_xscale * scale, scale, p2AngleToDraw, c_white, image_alpha);	
		//}
	}
	
	setup_plaid_texture(spr_skinTexture, 0);
	
	with(obj_player){
		//if (inP2Cam){
			draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p2AngleToDraw - 90), y - lengthdir_y(radius, p2AngleToDraw - 90), image_xscale * scale, scale, p2AngleToDraw, c_white, image_alpha);	
		//}
	}
	surface_reset_target();
	
	
	
	
	

	
	shader_reset();
	
	draw_surface(p1Surf, (-global.worldControl.ww * 2) - (global.worldControl.ww / 2), 0);
	draw_surface(p2Surf, (global.worldControl.ww * 2) - (global.worldControl.ww / 2), 0);
}else{
	surface_free(p1Surf);
	surface_free(p2Surf);
	
	p1Surf = surface_create(global.worldControl.ww, global.worldControl.hh);
	p2Surf = surface_create(global.worldControl.ww, global.worldControl.hh);
}
