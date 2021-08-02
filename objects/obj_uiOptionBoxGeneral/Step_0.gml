
//Check to see if the mouse is over an option when clicking
if (mouse_check_button_released(mb_left)){
	for (i = 0; i < optionNumber; i++){
		var mouseIsOverOption = (mouse_y >= (y + optionBoxY + optionArray[i,3]) && mouse_y <= (y + optionBoxY + optionArray[i,4])) && (mouse_x <= (x + optionBoxX + (optionBoxWidth * 16) + 24) && mouse_x >= (x + optionBoxX + 8));
		
		if (mouseIsOverOption){
			optionActivate = i;
			break;
		}
	}
}

//Activate the option that has been clicked
if (optionActivate != -1){
	//Store the id of the instance who owns the options
	var optionOwnerId = optionArray[optionActivate,1];
	
	if (!instance_exists(optionOwnerId)){
		instance_destroy();	
		exit;
	}
	
	//switch(optionArray[optionActivate,2]){	
		
		
	//}
}

//Hide the option box when the mouse is clicked anywhere off of the box
if (mouse_check_button_pressed(mb_left) || mouse_check_button_released(mb_right)){
	var mouseIsOutsideOfOptionBox = !point_in_rectangle(mouse_x + 8, mouse_y + 8, x, y, x + optionBoxX + (optionBoxWidth * 16) + 32, y + optionBoxY +  (optionBoxHeight * 16) + 32);
	
	if (mouseIsOutsideOfOptionBox){
		instance_destroy();
	}

}

#region Selecting With Arrows

	if (keyboard_check_pressed(vk_down)){
		if (selectingWithArrows && selectingWithArrowsPosition < scr_ui_option_box_get_option_number(id) - 1){
			selectingWithArrowsPosition ++;		
		}else if (!selectingWithArrows){
			selectingWithArrowsPosition = 0;		
		}
		
		selectingWithArrows = true;
	}
	
	if (keyboard_check_pressed(vk_up)){
		if (selectingWithArrows && selectingWithArrowsPosition > 0){
			selectingWithArrowsPosition --;
		}
		
		if (selectingWithArrowsPosition > 0){
			selectingWithArrows = true;	
		}
	}
	
	if (selectingWithArrows){
		
	}

#endregion





