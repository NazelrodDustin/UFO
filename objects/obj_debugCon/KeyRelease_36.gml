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
		globalDebugWindow.debugInstance = id;
		
		with(globalDebugWindow){
			//Add starting watch list
			//varWatchList[slotIndex,0] = "debugLayer"; //String name of the variable
			
			//setVariableNumber();
		}
	}
}

