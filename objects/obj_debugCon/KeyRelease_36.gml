/// @desc Turn on DEV Mode
if (global.devMode){
	global.devMode = false;
		
	if (instance_exists(globalDebugWindow)){
		instance_destroy(globalDebugWindow);
	}
		
	globalDebugWindow = noone;
}else{
	global.devMode = true;
	   
	//Create the global variables debug window
	if (globalDebugWindow == noone){
		var windowX = 0;
		var windowY = 0;
		
		globalDebugWindow = instance_create_layer(windowX + 20, windowY + 20, debugLayer, obj_uiWindowDebug);
		globalDebugWindow.debugInstance = obj_worldControl;
		
		with(globalDebugWindow){
			//Add starting watch list
			varWatchList[0,0] = "gamePaused"; //String name of the variable
			varWatchList[1,0] = "twoPlayer"; //String name of the variable
			varWatchList[2,0] = "worldAngle"; //String name of the variable
			varWatchList[3,0] = "groundSurface"; //String name of the variable
			varWatchList[4,0] = "playerPlacedObjects"; //String name of the variable
			
			setVariableNumber();
		}
	}
}

