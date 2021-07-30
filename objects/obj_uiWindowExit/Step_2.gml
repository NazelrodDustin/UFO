///Snap

if (instance_exists(myWindow)){
	x = myWindow.x + (myWindow.windowWidth * 16) + 16;
	y = myWindow.y;
}else{
	instance_destroy();	
}

if (instance_exists(myWindow)){

	if (myWindow.id == global.UiWindowSelected){	
		layer = obj_debugCon.debugLayer;
		////show_debug_message("shit");
	}else{
		layer = obj_debugCon.debugLayer;
	}

}

