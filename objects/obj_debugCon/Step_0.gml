
#region Double-click timer

if (mouse_check_button_released(mb_left)){
	if (doubleClickTimer == 0){
		doubleClickTimer = 1;	
	}else{
		global.doubleClick = true;	
	}
}
///Double click timer 
if (doubleClickTimer >= 1){
	doubleClickTimer ++;    
}

if (doubleClickTimer >= 20){
	doubleClickTimer = 0;
	global.doubleClick = false;
}
	
if (global.doubleClickLeftTimer >= 1){
	global.doubleClickLeftTimer ++;    
}
	
if (global.doubleClickLeftTimer >= 20){
	global.doubleClickLeftTimer = 0;
	global.doubleClickLeft = false;
}

#endregion

#region mouse click hold
//Timers that count up if a mouse button is held down
//left mouse
if (mouse_check_button(mb_left)){
	global.leftClickHoldTimer ++;
}else{
	global.leftClickHoldTimer = 0;		
}
//Rigght mouse
if (mouse_check_button(mb_right)){
	global.rightClickHoldTimer ++;
}else{
	global.rightClickHoldTimer = 0;		
}

#endregion

#region UI
	
gameCameraX = 0;
gameCameraY = 0;
gameCameraW = room_width;
gameCameraH = room_height;

#endregion




