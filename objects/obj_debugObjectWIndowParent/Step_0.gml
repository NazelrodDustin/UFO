if (keyboard_check(vk_control) && keyboard_check(ord("F"))){
	drawRectangleAroundInstance = position_meeting(mouse_x, mouse_y, id); 
	
	if (drawRectangleAroundInstance && mouse_check_button_pressed(mb_left) && !instance_exists(debugWindowId)){
		debugWindowId = instance_create_layer(x, y, "ui", obj_uiWindowDebug);
		debugWindowId.debugInstance = id;
	}
}else{
	drawRectangleAroundInstance = false;		
}
