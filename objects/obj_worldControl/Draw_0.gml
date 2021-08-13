#region Stars

starAngle = global.worldControl.player1Rotation;
starAngleP2 = global.worldControl.player2Rotation;

if (starSurfaceUpdate){
	starSurface	= surface_create(starFieldWidth, starFieldHeight);
	
	surface_set_target(starSurface);
	draw_clear_alpha(c_black, 0);
	
	for (var i = 0; i < numberOfStars; i++){
		var starX = starPosArray[i].x;
		var starY = starPosArray[i].y;
		var starCol = starPosArray[i].col;
		
		draw_sprite(spr_stars, irandom(sprite_get_number(spr_stars) - 1), starX, starY);
	}
	
	surface_reset_target();
	
	var surfWidth = surface_get_width(starSurface);
	var surfHeight = surface_get_height(starSurface);
	
	starSprite = sprite_create_from_surface(starSurface, 0, 0, surfWidth, surfHeight, false, false, surfWidth / 2, surfHeight /2);
	
	surface_free(starSurface);
	
	starSurfaceUpdate = false;
}else if (sprite_exists(starSprite) && starAlpha > 0){		
	var gameCameraX1 = camera_get_view_x(view_camera[0]) - 100;
	var gameCameraY1 = camera_get_view_y(view_camera[0]) - 250;
	var gameCameraW = camera_get_view_width(view_camera[0]);
	var gameCameraH = camera_get_view_height(view_camera[0]);
	draw_sprite_ext(starSprite, 0, gameCameraX1 + (gameCameraW / 2), gameCameraY1 + (gameCameraH / 2), 1, 1, starAngle, c_white, starAlpha);	
	
	if (twoPlayer){
		var gameCameraX2 = camera_get_view_x(view_camera[1]) - 100;
		var gameCameraY2 = camera_get_view_y(view_camera[1]) - 250;
		draw_sprite_ext(starSprite, 0, gameCameraX2 + (gameCameraW / 2), gameCameraY2 + (gameCameraH / 2), 1, 1, starAngleP2, c_white, starAlpha);
	}

}else if (starAlpha > 0){
	starSurfaceUpdate = true;	
}

#endregion

#region Draw Ground

if (surface_exists(groundSurface)){
	draw_surface(groundSurface, (-ww * 2) - (ww / 2), hh * (3 / 4));
	draw_surface(groundSurface, (ww * 2) - (ww / 2), hh * (3 / 4));
}else{
	var steps = 512;
	var radius = yy;
	var startOffset = floor(point_direction(xx, yy, ww, hh));
	var drawAmount = 180 - (startOffset * 2);
	var tempGroundSurface = surface_create(ww, (hh / 4) + 5);
	surface_set_target(tempGroundSurface);
	draw_clear_alpha(c_black, 0);
	
	draw_primitive_begin(pr_trianglefan);
	draw_vertex(xx, yy);
	for(var i = 0; i <= steps; ++i){
		draw_vertex(xx + lengthdir_x(radius, startOffset + (drawAmount * i / steps)), yy + lengthdir_y(radius, startOffset + (drawAmount * i / steps)));
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

#endregion


