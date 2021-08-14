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
	
	surface_set_target(p1Surf);
	setup_plaid_texture(spr_metalTexture, 0);
	
	with(obj_ufo){
		draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p1AngleToDraw - 90), y - lengthdir_y(radius, p1AngleToDraw - 90), image_xscale * scale, scale, p1AngleToDraw, c_white, image_alpha);	
	}
	
	with(obj_radioTower){
		draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p1AngleToDraw - 90), y - lengthdir_y(radius, p1AngleToDraw - 90), image_xscale * scale, scale, p1AngleToDraw, c_white, image_alpha);	
	}
	
	
	with(obj_barricade){
		draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p1AngleToDraw - 90), y - lengthdir_y(radius, p1AngleToDraw - 90), image_xscale * scale, scale, p1AngleToDraw, c_white, image_alpha);	
	}
	
	setup_plaid_texture(spr_zombieSkinTexture, 0);
	
	with(obj_zombie){
		draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p1AngleToDraw - 90), y - lengthdir_y(radius, p1AngleToDraw - 90), image_xscale * scale, scale, p1AngleToDraw, c_white, image_alpha);	
	}
	
	setup_plaid_texture(spr_skinTexture, 0);
	
	with(obj_player){
		draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p1AngleToDraw - 90), y - lengthdir_y(radius, p1AngleToDraw - 90), image_xscale * scale, scale, p1AngleToDraw, c_white, image_alpha);	
	}
	surface_reset_target();
	
	surface_set_target(p2Surf);
	setup_plaid_texture(spr_metalTexture, 0);
	
	with(obj_ufo){
		draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p2AngleToDraw - 90), y - lengthdir_y(radius, p2AngleToDraw - 90), image_xscale * scale, scale, p2AngleToDraw, c_white, image_alpha);	
	}
	
	with(obj_radioTower){
		draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p2AngleToDraw - 90), y - lengthdir_y(radius, p2AngleToDraw - 90), image_xscale * scale, scale, p2AngleToDraw, c_white, image_alpha);	
	}


	with(obj_barricade){
		draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p2AngleToDraw - 90), y - lengthdir_y(radius, p2AngleToDraw - 90), image_xscale * scale, scale, p2AngleToDraw, c_white, image_alpha);	
	}

	
	setup_plaid_texture(spr_zombieSkinTexture, 0);
	
	with(obj_zombie){
		draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p2AngleToDraw - 90), y - lengthdir_y(radius, p2AngleToDraw - 90), image_xscale * scale, scale, p2AngleToDraw, c_white, image_alpha);	
	}
	
	setup_plaid_texture(spr_skinTexture, 0);
	
	with(obj_player){
		draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p2AngleToDraw - 90), y - lengthdir_y(radius, p2AngleToDraw - 90), image_xscale * scale, scale, p2AngleToDraw, c_white, image_alpha);	
	}
	surface_reset_target();
	
	
	
	
	

	
	shader_reset();
	
	//Debug.
	surface_set_target(p1Surf);
		with (obj_lazer){
			draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p1AngleToDraw - 90), y - lengthdir_y(radius, p1AngleToDraw - 90), image_xscale * scale, scale, p1AngleToDraw, c_white, image_alpha);	
		}
		
		with(obj_rotatableObject){
			if (!(object_index == obj_lazer)){
				var surf = surface_create(widthTarget, 4);
				var sw = surface_get_width(surf)
				var sh = surface_get_height(surf)
				surface_set_target(surf);
				draw_clear_alpha(c_black, 0);
				draw_healthbar(0, 0, sw, sh, (myHealth / maxHealth) * 100, c_red, c_green, c_lime, 0, true, false);
				surface_reset_target();
				

				var surfSprite = sprite_create_from_surface(surf, 0, 0, sw, sh, false, false, sw / 2, sh);
				surface_free(surf);
				draw_sprite_ext(surfSprite, 0, x - lengthdir_x(radius + 70, p1AngleToDraw - 90), y - lengthdir_y(radius + 70, p1AngleToDraw - 90), 1, 1, p1AngleToDraw, c_white, image_alpha);	
			}
		}
	surface_reset_target();
	
	surface_set_target(p2Surf);
		with (obj_lazer){
			draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, p2AngleToDraw - 90), y - lengthdir_y(radius, p2AngleToDraw - 90), image_xscale * scale, scale, p2AngleToDraw, c_white, image_alpha);	
		}
		
		with(obj_player){
			var idString = myHealth;
			draw_text_transformed(x - lengthdir_x(radius + 70, p2AngleToDraw - 90), y - lengthdir_y(radius + 70, p2AngleToDraw - 90), string(idString), 1, 1, p2AngleToDraw);	
		}
		
		with(obj_zombie){
			var idString = myHealth;
			draw_text_transformed(x - lengthdir_x(radius + 70, p2AngleToDraw - 90), y - lengthdir_y(radius + 70, p2AngleToDraw - 90), string(idString), 1, 1, p2AngleToDraw);	
		}
	surface_reset_target();
	
	
	
	draw_surface(p1Surf, (-global.worldControl.ww * 2) - (global.worldControl.ww / 2), 0);
	draw_surface(p2Surf, (global.worldControl.ww * 2) - (global.worldControl.ww / 2), 0);
}else{
	surface_free(p1Surf);
	surface_free(p2Surf);
	
	p1Surf = surface_create(global.worldControl.ww, global.worldControl.hh);
	p2Surf = surface_create(global.worldControl.ww, global.worldControl.hh);
}
