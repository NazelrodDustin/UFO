//if (live_call()) return live_result;

#region //Camera variable update 
gameCameraX = 0;
gameCameraY = 0;
gameCameraW = room_width;
gameCameraH = room_height;
#endregion

///Snap to view
if (!dragging){
	x = gameCameraX + xPos;
	y = gameCameraY + yPos;
}else{
	x = mouse_x - xOff;
	y = mouse_y - yOff;
}

if (instance_exists(backingInstance)){
	backingInstance.x = x;
	backingInstance.y = y;
}

#region ScrollingElement
if (hasScrollingElement && global.UiWindowSelected == id){
	var mouseIsInsideWindow = position_meeting(mouse_x, mouse_y, backingInstance);
	var mouseIsntTooFarToTheRight = position_meeting(mouse_x + 25, mouse_y, backingInstance);
	var increment = 8;
	
	if (drawScrollBar){
		//down
		if (scrollingSurfaceDrawY + scrollingSurfacePortHeight < scrollingSurfaceHeight - (increment / 2)){
			if ((keyboard_check(vk_down) || mouse_wheel_down()) && mouseIsInsideWindow){
				if ((scrollBarY + scrollBarHeight) < (scrollingSurfacePortY + scrollingSurfacePortHeight) && !instance_exists(obj_uiOptionBoxGeneral)){
					scrollingSurfaceDrawY += increment;		
				}else{
					//	
				}
			}
		}
	
		//up
		if (scrollingSurfaceDrawY >= 0){
			if ((keyboard_check(vk_up) || mouse_wheel_up()) && mouseIsInsideWindow && !instance_exists(obj_uiOptionBoxGeneral)){
				if (scrollBarY > scrollingSurfacePortY){
					scrollingSurfaceDrawY -= increment;		
				}else{
					scrollBarY = scrollingSurfacePortY;	
				}
			}
	
		}
	}
	
	scrollBarY = clamp(round(scrollingSurfacePortY + ((scrollingSurfaceDrawY / scrollingPortToSurfaceRatio) / 1)), scrollingSurfacePortY, scrollingSurfacePortY + scrollingSurfacePortHeight);
	
	//Find click region for bar
	if (mouse_check_button_pressed(mb_left) && drawScrollBar){
		var scrollBarX1 = x + scrollingSurfacePortX + scrollingSurfacePortWidth + 1;
		var scrollBarX2 = x + scrollingSurfacePortX + scrollingSurfacePortWidth + 10;
		var scrollBarY1 = y + scrollBarY + 0
		var scrollBarY2 = y + scrollBarY + scrollBarHeight - 0;
		if (point_in_rectangle(mouse_x, mouse_y, scrollBarX1, scrollBarY1, scrollBarX2, scrollBarY2)){
			scrollBarDragging = true;
			dragStartX = mouse_x;
			dragStartY = mouse_y;
		}
	}
	
	if (mouse_check_button_released(mb_left) && scrollBarDragging){
		scrollBarDragging = false;
	}
	
	//Dragging 
	if (scrollBarDragging){
		var portY = y + scrollingSurfacePortY;
		////show_debug_message("portY: " + string(portY));
		////show_debug_message("mouse_y: " + string(mouse_y));
		var bottomOfPortY = y + scrollingSurfacePortY + scrollingSurfacePortHeight;
		////show_debug_message("bottomY: " + string(bottomOfPortY));
		var percentOfPort = ((mouse_y - (scrollBarHeight / 2)) - portY) / (bottomOfPortY - portY);
		////show_debug_message("%: " + string(percentOfPort));
		scrollingSurfaceDrawY = clamp(scrollingSurfaceHeight * clamp(percentOfPort, -.03, 1), 0, scrollingSurfaceHeight - scrollingSurfacePortHeight);		
	}
}
#endregion








