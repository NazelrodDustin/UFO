event_inherited();

var mouseIsntTooFarToTheRight = position_meeting(mouse_x + 25, mouse_y, backingInstance);
var mouseIsInsideWindow = position_meeting(mouse_x, mouse_y, backingInstance); 
var varWatchListSecondDimensionSize = array_length_2d(varWatchList, 0);
var mouseIsOverSaveLayoutText = point_in_rectangle(mouse_x, mouse_y, x + 20 , y + 332, x + 20 + string_width("+ Save Layout"), y + 340);

switch (currentScreen){
	case "watchList":
		var mouseIsOverAddVariableText = point_in_rectangle(mouse_x, mouse_y, x + 20 , y + 332, x + 20 + string_width("+ Add Variable"), y + 340);
		var screenArraySize = varWatchListSize;
	break;
	
	case "saveLayouts":
		var screenArraySize = layoutArraySize;
		var mouseIsOverSaveLayoutText = point_in_rectangle(mouse_x, mouse_y, x + 20 , y + 332, x + 20 + string_width("+ Save Layout"), y + 340);
		var mouseIsOverBack = point_in_rectangle(mouse_x, mouse_y, x + 14, y + 15, x + 14 + string_width("< Back to watchlist"), y + 23);
	break;
	
	case "loadLayouts":
		var screenArraySize = layoutArraySize;
		var mouseIsOverSaveLayoutText = point_in_rectangle(mouse_x, mouse_y, x + 20 , y + 332, x + 20 + string_width("+ Save Layout"), y + 340);
		var mouseIsOverBack = point_in_rectangle(mouse_x, mouse_y, x + 14, y + 15, x + 14 + string_width("< Back to watchlist"), y + 23);
	break;
}

scrollingSurfaceUpdate = true;

if (initialNameUpdate){
	initialNameUpdate = false;
}

if (instance_exists(debugInstance)){
	variableUpdateTimer ++;
	
	if (variableUpdateTimer >= variableUpdateRate){
		scrollingSurfaceUpdate = true;
		variableUpdateTimer = 0;
	}
}else{
	instance_destroy();	
}

addingSineThing = (addingSineThing + 1) & 31; 
alphaForInputs = sin(addingSineThing * .15);

#region Dragging
	
	//Start dragging slot
	if (currentScreen == "watchList" && !instance_exists(obj_uiOptionBoxGeneral) && !slotBeingDragged && slotBeingDraggedIndex == -1 && global.leftClickHoldTimer > 7 && mouseIsntTooFarToTheRight && !scrollBarDragging){
		global.leftClickHoldTimer = 0;
		
		if (slotThatMouseIsOver != -1){		
			var variableStringName = varWatchList[slotThatMouseIsOver,0];
			var instanceScope = varWatchList[slotThatMouseIsOver,3] != noone ? varWatchList[slotThatMouseIsOver,3] : debugInstance;
			var arrayId = (instanceScope == global) ? variable_global_get(variableStringName) : variable_instance_get(instanceScope, variableStringName);
			var isArray = is_array(arrayId);
			var arrayIndex = varWatchList[slotThatMouseIsOver,2];
			var is1DArray = (array_height_2d(arrayId) == 1);
			var arrayFirstDimensionSize = is1DArray == true ? array_length_1d(arrayId) : array_height_2d(arrayId);
			var arrayFirstDimensionIsCollapsed = varWatchList[slotThatMouseIsOver,1];
				
			if (arrayIndex == -1 && isArray && !arrayFirstDimensionIsCollapsed){
				varWatchList[slotThatMouseIsOver,1] = !varWatchList[slotThatMouseIsOver,1];
					
				//Make sure that all of the second dimension indexs are gonna be collapsed with the rest
				var extraCollapse = 0;
							
				for (i = slotThatMouseIsOver + 1; i < 500; i++){
					if (varWatchList[i,0] == variableStringName && varWatchList[i,4] != 0){
						extraCollapse++;	
					}
								
					if (varWatchList[i,0] == "-00"){
						break;	
					}
				}
							
				for (i = slotThatMouseIsOver + 1; i < arrayFirstDimensionSize + slotThatMouseIsOver + 1 + extraCollapse; i++){
					if (varWatchList[i,0] == variableStringName){
						varWatchList[i,0] = "-00";
					}else{
						break;	
					}
				}
							
				scr_array_sort_2d("-00", varWatchList);
				varWatchListSize -= arrayFirstDimensionSize + extraCollapse;
				slotLinesToDraw =	varWatchListSize; 		
			}
				
			if (arrayIndex == -1 || !isArray){
				slotBeingDraggedIndex = slotThatMouseIsOver;		
			}
				
			slotBeingDragged = true;
			
			//You have to clear the surface so that the scrollbar will update
			if (surface_exists(scrollingSurface)){
				surface_free(scrollingSurface);	
			}
		}
	}
	
	//Slot is being dragged
	if (mouse_check_button_released(mb_left) && slotBeingDragged){
		if (!instance_exists(obj_uiOptionBoxGeneral) && slotBeingDraggedIndex != -1){
			if (slotThatMouseIsOver != -1){
				//If the slot that the mouse is being dragged to is an array, we need to collapse it before the switching takes place
				var destVariableStringName = varWatchList[slotThatMouseIsOver,0];
				var destInstanceScope = varWatchList[slotThatMouseIsOver,3] != noone ? varWatchList[slotThatMouseIsOver,3] : debugInstance;
				var destArrayId = (destInstanceScope == global) ? variable_global_get(destVariableStringName) : variable_instance_get(destInstanceScope, destVariableStringName);
				var destIsArray = is_array(destArrayId);
				var destArrayFirstDimensionIndex = varWatchList[slotThatMouseIsOver,2];
				var destIs1DArray = (array_height_2d(destArrayId) == 1);
				var destArrayFirstDimensionSize = destIs1DArray == true ? array_length_1d(destArrayId) : array_height_2d(destArrayId);
				var destArrayFirstDimensionIsCollapsed = varWatchList[slotThatMouseIsOver,1];
				if (destArrayFirstDimensionIndex == -1){
					if (destIsArray && !destArrayFirstDimensionIsCollapsed){
						varWatchList[slotThatMouseIsOver,1] = !varWatchList[slotThatMouseIsOver,1];
					
						//Make sure that all of the second dimension indexs are gonna be collapsed with the rest
						var extraCollapse = 0;
							
						for (i = slotThatMouseIsOver + 1; i < 500; i++){
							if (varWatchList[i,0] == destVariableStringName && varWatchList[i,4] != 0){
								extraCollapse++;	
							}
								
							if (varWatchList[i,0] == "-00"){
								break;	
							}
						}
							
						for (i = slotThatMouseIsOver + 1; i < destArrayFirstDimensionSize + slotThatMouseIsOver + 1 + extraCollapse; i++){
							if (varWatchList[i,0] == destVariableStringName){
								varWatchList[i,0] = "-00";
							}else{
								break;	
							}
						}
							
						varWatchListSize -= destArrayFirstDimensionSize + extraCollapse;
						slotLinesToDraw =	varWatchListSize;
					}
				
					//create temp ds to hold the dragged slot's info
					var tempSlot = ds_grid_create(10, 10);
					
					for (i = 0; i < varWatchListSecondDimensionSize; i++){
						tempSlot[# 0,i] = varWatchList[slotBeingDraggedIndex, i];
					}
				
					//Copy the slot the mouse is over, to the dragged slot
					for (i = 0; i < varWatchListSecondDimensionSize; i++){
						varWatchList[slotBeingDraggedIndex, i] = varWatchList[slotThatMouseIsOver, i];
					}
				
					//Copy the dragged slot, to the slot the mouse is over
					for (i = 0; i < varWatchListSecondDimensionSize; i++){
						varWatchList[slotThatMouseIsOver,i] = tempSlot[# 0,i]; 
					}
					
					if (ds_exists(tempSlot, ds_type_grid)){
						ds_grid_destroy(tempSlot);	
					}
					
					scr_array_sort_2d("-00", varWatchList);
				}
				
				slotBeingDraggedIndex = -1;
			}
		}
			
		slotBeingDraggedIndex = -1;
		slotBeingDragged = false;
	}
	
	////show_debug_message("slotBeingDragged: " + string(slotBeingDragged));
	////show_debug_message("slotBeingDraggedIndex: " + string(slotBeingDraggedIndex)); 
	
	#endregion

#region Clicking add variable 

	if (currentScreen == "watchList" && mouse_check_button_released(mb_left) && !instance_exists(obj_uiOptionBoxGeneral) && !slotBeingDragged && !addingNewVariable){
		if (mouseIsOverAddVariableText){
			addingNewVariable = true;	
			keyboard_string = "";
			global.typing = true;
			varWatchListSize ++;
			slotLinesToDraw = varWatchListSize;
		}
	}
	
	if (addingNewVariable && currentScreen == "watchList"){
		var refreshAutoComplete = (addVariableString != keyboard_string) || (xxRefresh != x) || (yyRefresh != y);
		//sdbm(refreshAutoComplete, addVariableString, keyboard_string);
		
		xxRefresh = x;
		yyRefresh = y;
		addVariableString = keyboard_string;	
		var addVarStringSize = string_length(addVariableString);
		var commentFilePath = working_directory + "Debug Windows/Comments/";
		var boolMarkerFilePath = working_directory + "Debug Windows/Bools/";
		var variableReadyToBeAdded = false;
		var hasAutocompleteVaraibleTypeInString = false;
		
		#region Autocomplete
		if (refreshAutoComplete){
			//Check for change in scope
			var potentialScope = -1;
			
			for (i = 1; i < addVarStringSize + 1; i++){
				if (string_char_at(addVariableString, i) == "." && i != 1){
					potentialScope = string_copy(addVariableString, 0, i - 1);
					var instScopeReal = debugInstance;
					
					if (potentialScope == "global"){
						variableListDs = variable_instance_get_names(global);
					}else if (variable_instance_exists(instScopeReal, potentialScope)){
						var valueOfVariable = variable_instance_get(instScopeReal, potentialScope);
					
						if (instance_exists(real(valueOfVariable))){
							variableListDs = variable_instance_get_names(valueOfVariable);			
						}
					}else if (asset_get_index(potentialScope) != -1){
						variableListDs = variable_instance_get_names(asset_get_index(potentialScope).id);		
					}else if (!string_has_letters(potentialScope)){
						var instId = real(potentialScope);
					
						if (instance_exists(instId)){
							varScopeReal = instId;	
						}
					}else{
						potentialScope = "";
					}
				
					break;
				}
			}

			if (potentialScope == -1){
				variableListDs = variable_instance_get_names(debugInstance);	
			}else{
				addVarStringSize = string_length(addVariableString) - (string_length(potentialScope) + 1);	
			}
		
			var varListSize = array_length_1d(variableListDs);
			var tempVarList = ds_list_create();
		

			if (instance_exists(autoCompleteOptionBox)){
				with(autoCompleteOptionBox){
					instance_destroy();	
				}
			}
			
			var autoCompleteScopeOffset = (potentialScope != -1) ? string_length(potentialScope) + 1 : 0;
			
			for (i = 0; i < varListSize; i++){
				var varListString = variableListDs[i];
			
				for (a = 1; a <= addVarStringSize; a++){
					var varListChar = string_char_at(varListString, a);
					var addVariableStringChar = string_char_at(addVariableString, a + autoCompleteScopeOffset);
				
					if (varListChar != addVariableStringChar){	
						break;	
					}else if (a == addVarStringSize){
						ds_list_add(tempVarList, varListString);	
						break;
					}
				}
			}
		
			var tempListSize = ds_list_size(tempVarList);
		
			if (tempListSize > 0){
				var xx = x + 5; 
				var yy = varWatchListSize * 16;
				var slotY = y + (scrollingSurfacePortY - scrollingSurfaceDrawY) + yy;
	
				autoCompleteOptionBox = scr_ui_option_box_create();
				autoCompleteOptionBox.x = xx;
				autoCompleteOptionBox.y = slotY;
		
				for (i = 0; i < tempListSize; i++){
					var stringToDraw = (potentialScope == -1) ? tempVarList[|i] : potentialScope + "." + tempVarList[|i];
					var arrayId = variable_instance_get(debugInstance, stringToDraw);
					var isArray = is_array(arrayId);
					var is1DArray = (array_height_2d(arrayId) == 1);
					var variableScopeTypeString = (!isArray) ? (potentialScope == "global" ? " Global " : " Instance ") : ((potentialScope == "global ") ? "Global " : ""); 
					var variableTypeString = (!isArray) ?  "Variable" : ((is1DArray == true) ? "  - 1D Array" : "  - 2D Array"); 
				
					scr_ui_option_box_add_option(autoCompleteOptionBox, stringToDraw + "  -" + variableScopeTypeString + variableTypeString, id, GLOBAL_INFO_BOX_OPTION_TYPES.none);
					draw_set_color(c_white);
					 //draw_text(xx, yy, stringToDraw);
					draw_set_color(c_black);
			
					yy += 16;
				}
			
				scr_ui_option_box_reize(autoCompleteOptionBox);
			}
		
			ds_list_destroy(tempVarList);
		}
		#endregion
		
		#region Pressing ENTER
		if (keyboard_check_pressed(vk_enter)){
			if (instance_exists(autoCompleteOptionBox)){
				if (autoCompleteOptionBox.selectingWithArrows){
					var optionArrayId = autoCompleteOptionBox.optionArray;
					var optionPosition = autoCompleteOptionBox.selectingWithArrowsPosition;
					var optionString = optionArrayId[optionPosition, 0]; 
					
					addVariableString = optionString;	
					hasAutocompleteVaraibleTypeInString = true;
				}
			}

			variableReadyToBeAdded = true;
		}
		#endregion
		
		#region Pressing tab to autocomplete the first option
		if (keyboard_check_pressed(vk_tab)){
			if (instance_exists(autoCompleteOptionBox)){
				var optionArrayId = autoCompleteOptionBox.optionArray;		
				var optionString = optionArrayId[0, 0];
				
				hasAutocompleteVaraibleTypeInString = true;
				addVariableString = optionString;
				variableReadyToBeAdded = true;
			}
		}
		#endregion

		#region Clicking an autocomplete option
		if (instance_exists(autoCompleteOptionBox)){
			if (autoCompleteOptionBox.optionActivate != -1){
				addVariableString = autoCompleteOptionBox.optionArray[autoCompleteOptionBox.optionActivate,0];
			
				hasAutocompleteVaraibleTypeInString = true;
				variableReadyToBeAdded = true;
			}
		}
		#endregion
		
		#region Adding the variable to the watchlist
		if (variableReadyToBeAdded){
			if (hasAutocompleteVaraibleTypeInString){
				#region Parse through the string and take out the variable type 
					var varStringLength = string_length(addVariableString);
						
					for (a = 1; a < varStringLength + 1; a ++){
						if (string_char_at(addVariableString, a) == " "){
							addVariableString = string_copy(addVariableString, 1, a - 1);
						}
					}
				#endregion		
			}
			
			#region Find the scope of the variable
			var varScopeString = "";
			
			addVarStringSize = string_length(addVariableString);
			
			for (i = 1; i < addVarStringSize + 1; i++){
				if (string_char_at(addVariableString, i) == "." && i != 1){
					varScopeString = string_copy(addVariableString, 0, i - 1);
					break;
				}
			}
			
			if (varScopeString != ""){
				for (i = 1; i < addVarStringSize; i++){
					if (string_char_at(addVariableString, i) == "."){
						addVariableString = string_copy(addVariableString, i + 1, addVarStringSize - i);
						//sm(addVariableString);
					}	
				}
			}		
			
			var varScopeReal = noone;
			
			switch(varScopeString){
				case "global":
					varScopeReal = global;	
				break;
			}
			
			//If the scope wasn't global
			if (varScopeReal == noone && varScopeString != ""){
				//See if it's an instance id
				if (!string_has_letters(varScopeString)){
					var instId = real(varScopeString);
					
					if (instance_exists(instId)){
						varScopeReal = instId;	
					}
				}else{
					//See if the scope is an inst id held in an instance var
					var scopeVarExists = variable_instance_exists(debugInstance, varScopeString);
					var scopeVarValue = (scopeVarExists) ? variable_instance_get(debugInstance, varScopeString) : noone;
					
					if (instance_exists(scopeVarValue)){
						varScopeReal = scopeVarValue;	
					}
					
					//See if the scope is an object_index
					var objectIndex = asset_get_index(varScopeString);
					
					if (objectIndex != -1){
						if (instance_exists(objectIndex)){
							varScopeReal = objectIndex.id;	
						}
					}
				}
			}
			#endregion
			
			var variableExists = (varScopeReal == global) ? variable_global_exists(addVariableString) : variable_instance_exists(((varScopeReal !=  noone) ? varScopeReal : debugInstance), addVariableString);
			
			if (variableExists){
				var varValueOrId = (varScopeReal == global) ? variable_global_get(addVariableString) : variable_instance_get(((varScopeReal !=  noone) ? varScopeReal : debugInstance), addVariableString); 
				var varIsArray = is_array(varValueOrId);
				var is1DArray = (array_height_2d(varValueOrId) == 1);
				var arrayFirstDimensionSize = is1DArray == true ? array_length_1d(varValueOrId) : array_height_2d(varValueOrId);
				var arraySecondDimensionSize = is1DArray == false ? array_length_2d(varValueOrId, 0) : 0;
				var fileName = addVariableString + ".aug"
				
				varWatchList[varWatchListSize - 1, 0] = addVariableString; //I am minusing 1 here because I increase the size of the varWatchList when the addVariable button		
				
				if (varScopeReal != noone){
					varWatchList[varWatchListSize - 1, 3] = varScopeReal;	
					varWatchList[varWatchListSize - 1, 7] = varScopeString + ".";
				}
				
				#region Load comments if they exist
				if (!varIsArray){
					//Regular vars
					if (file_exists(commentFilePath + fileName)){
						var fileIndex = file_bin_open(commentFilePath + fileName,0);
						file_bin_seek(fileIndex, 1); //Because we do not care about INDICATOR
						var commentString = file_bin_read_string(fileIndex)
						file_bin_close(fileIndex);	
					
						varWatchList[varWatchListSize - 1, 6] = commentString;
					}
				}else{
					//ARRAYS-------------------
					if (file_exists(commentFilePath + fileName)){
						var commentDsGridId = ds_grid_create(arrayFirstDimensionSize + 1, arraySecondDimensionSize + 1);
						varWatchList[varWatchListSize - 1, 6] = commentDsGridId;
						var fileIndex = file_bin_open(commentFilePath + fileName, 0);
						file_bin_seek(fileIndex, 0);
						var fileSize = file_bin_size(fileIndex);
						
						while (file_bin_position(fileIndex) < file_bin_size(fileIndex)){	
							file_bin_seek(fileIndex, file_bin_position(fileIndex) + 1); //Skip INDICATOR
							var firstDimensionIndex = file_bin_read_real(fileIndex); //Read first dimension index
							file_bin_seek(fileIndex, file_bin_position(fileIndex) + 1); //Skip INDICATOR
							var secondDimensionIndex = file_bin_read_real(fileIndex); //Read second dimension index 
							file_bin_seek(fileIndex, file_bin_position(fileIndex) + 1); //Skip INDICATOR
							var commentString = file_bin_read_string(fileIndex); //Read the comment string
							
							if (ds_exists(commentDsGridId, ds_type_grid)){
								//sm(firstDimensionIndex, secondDimensionIndex, commentString);
								commentDsGridId[# firstDimensionIndex, secondDimensionIndex] = commentString;	
							}
						}
						
						file_bin_close(fileIndex);
					}
				}
				#endregion
				
				#region Load bool markers if they exist
				if (!varIsArray){
					//Regular vars
					if (file_exists(boolMarkerFilePath + fileName)){
						varWatchList[varWatchListSize - 1, 8] = true;
					}
				}else{
					//ARRAYS-------------------
					if (file_exists(boolMarkerFilePath + fileName)){
						var boolDsGridId = ds_grid_create(arrayFirstDimensionSize + 1, arraySecondDimensionSize + 1);
						varWatchList[varWatchListSize - 1, 8] = boolDsGridId;
						var fileIndex = file_bin_open(boolMarkerFilePath + fileName, 0);
						file_bin_seek(fileIndex, 0);
						var fileSize = file_bin_size(fileIndex);
						
						while (file_bin_position(fileIndex) < file_bin_size(fileIndex)){	
							file_bin_seek(fileIndex, file_bin_position(fileIndex) + 1); //Skip INDICATOR
							var firstDimensionIndex = file_bin_read_real(fileIndex); //Read first dimension index
							file_bin_seek(fileIndex, file_bin_position(fileIndex) + 1); //Skip INDICATOR
							var secondDimensionIndex = file_bin_read_real(fileIndex); //Read second dimension index 
							file_bin_seek(fileIndex, file_bin_position(fileIndex) + 1); //Skip INDICATOR
							var boolValue = file_bin_read_real(fileIndex); //Read the comment string
							
							if (ds_exists(boolDsGridId, ds_type_grid)){
								//sm(firstDimensionIndex, secondDimensionIndex, commentString);
								boolDsGridId[# firstDimensionIndex, secondDimensionIndex] = boolValue;	
							}
						}
						
						file_bin_close(fileIndex);
					}
				}
				#endregion
			
				if (surface_exists(scrollingSurface)){
					surface_free(scrollingSurface);	
				}
			}else{
				varWatchListSize --;
				slotLinesToDraw = varWatchListSize;
			}
			
			if (instance_exists(autoCompleteOptionBox)){
				instance_destroy(autoCompleteOptionBox);	
			}
			
			addingNewVariable = false;	
			global.typing = false;
		}
		#endregion
	}

#endregion

#region Adding Comments

	if (addingNewComment){
		addCommentString = keyboard_string;	
		
		if (keyboard_check_released(vk_enter)){
			var varString = varWatchList[addCommentSlot, 0];
			var instanceScope = varWatchList[addCommentSlot, 3] != noone ? varWatchList[addCommentSlot, 3] : debugInstance; 
			var varArrayIdOrValue = variable_instance_get(instanceScope, varString);
			var varIsArray = is_array(varArrayIdOrValue);
			var is1DArray = (array_height_2d(varArrayIdOrValue) == 1);
			var arrayFirstDimensionIndex = varWatchList[addCommentSlot,2];
			var arrayFirstDimensionSize = is1DArray == true ? array_length_1d(varArrayIdOrValue) : array_height_2d(varArrayIdOrValue);
			var arraySecondDimensionIndex = varWatchList[addCommentSlot,4]; 
			var arraySecondDimensionSize = is1DArray == false ? array_length_2d(varArrayIdOrValue, arrayFirstDimensionIndex) : 0;
			var filePath = working_directory + "Debug Windows/Comments/";
			var fileName = filePath + varString + ".aug";
			
			if (addCommentString != "" || addCommentString != ""){
				//If a comment file already exists, delete it
				if (file_exists(fileName)){
					//file_delete(fileName);
					//sm("File deleted");
				}
				
				if (!varIsArray){
					var fileIndex = file_bin_open(fileName, 1);
					file_bin_write_string(fileIndex, addCommentString);
					file_bin_close(fileIndex);
					
					varWatchList[addCommentSlot, 6] = addCommentString;
				}else if (arrayFirstDimensionIndex != -1){
					//Look for existing ds_grid to hold comments
					var arrayHeaderIndex = addCommentSlot - (arrayFirstDimensionIndex + arraySecondDimensionIndex + 1);
					var g = 0;
								
					while (varWatchList[addCommentSlot - g,2] != -1){
						g++;
					}
								
					var commentDsGridId = varWatchList[addCommentSlot - g,6];
					//var commentDsGridId = varWatchList[arrayHeaderIndex, 6];
					
					if (commentDsGridId != "" && ds_exists(commentDsGridId, ds_type_grid)){
						commentDsGridId[# arrayFirstDimensionIndex,arraySecondDimensionIndex] = addCommentString;		
						
						//Loop through the commentDs and save all of the comments
						var fileIndex = file_bin_open(fileName, 1);
						
						var firstDimensionSize = ds_grid_width(commentDsGridId);
						var secondDimensionSize = ds_grid_height(commentDsGridId);
						
						for (i = 0; i < firstDimensionSize; i++){
							for (a = 0; a < secondDimensionSize; a++){
								var commentString = commentDsGridId[# i,a];
								
								if (commentString != 0 && is_string(commentString)){
									file_bin_write_real(fileIndex, i);
									file_bin_write_real(fileIndex, a);
									file_bin_write_string(fileIndex, commentString); 
									//sdbm(i, a, commentString);
								}
							}
						}
						
						file_bin_close(fileIndex);
					}else if (commentDsGridId == ""){
						varWatchList[arrayHeaderIndex, 6] = ds_grid_create(arrayFirstDimensionSize + 1, arraySecondDimensionSize + 1);
						commentDsGridId = varWatchList[arrayHeaderIndex, 6];
							
						if (ds_exists(commentDsGridId,ds_type_grid)){
							commentDsGridId[# arrayFirstDimensionIndex,arraySecondDimensionIndex] = addCommentString;	
							
							//Save comment (This assumes there has never been a commment made on this array)
							var fileIndex = file_bin_open(fileName, 1);
							
							file_bin_write_real(fileIndex, arrayFirstDimensionIndex);
							file_bin_write_real(fileIndex, arraySecondDimensionIndex);
							file_bin_write_string(fileIndex, addCommentString);
							file_bin_close(fileIndex);
							//sdbm(arrayFirstDimensionIndex, arraySecondDimensionIndex, addCommentString);
						}
					}
				}
			}
			
			addCommentSlot = -1;
			addingNewComment = false;
			keyboard_string = "";
			global.typing = false;
		}
	}

#endregion

#region Saving New Layout

if (currentScreen == "saveLayouts" && mouse_check_button_released(mb_left) && !instance_exists(obj_uiOptionBoxGeneral) && !savingLayout && mouseIsOverSaveLayoutText){	
	savingLayout = true;	
	keyboard_string = "";
	global.typing = true;
	layoutArraySize ++;	
}

if (currentScreen == "saveLayouts" && savingLayout){	
	var fullLayoutPath = working_directory + "Debug Windows/Layouts/" + object_get_name(debugInstance.object_index) + "/";
	
	if (keyboard_check_pressed(vk_enter) && (keyboard_string != "" || keyboard_string != " ")){
		if ((keyboard_string == "" || keyboard_string == " ")){
			savingLayout = false;	
			layoutArraySize --;
		}else{
			layoutArray[layoutArraySize - 1] = keyboard_string;		
		
			var fileIndex = file_bin_open(fullLayoutPath + keyboard_string + ".aug", 1);		
			
			for (i = 0; i < varWatchListSize; i++){
				var varString = varWatchList[i,0];
				var scopeString = varWatchList[i,7];	
				
				if (varString != "-00" && (string_has_letters(scopeString) || (scopeString == ""))){
					file_bin_write_string(fileIndex, varString);		
					file_bin_write_string(fileIndex, scopeString);
				}else{
					break;
				}
			}
		
			file_bin_close(fileIndex);
		
			savingLayout = false;
		}
	}
}

#endregion

#region optionBox
	
	//Check for clicks on the variable slots
	if (mouse_check_button_pressed(mb_right) && !instance_exists(itemSlotOptionBox) && mouseIsInsideWindow){
		if (slotThatMouseIsOver != -1){
			variableSlotForOptionBox = slotThatMouseIsOver;
			variableSlotOptionBox = scr_ui_option_box_create();
			variableSlotOptionBox.x = mouse_x;
			mouseXOffsetForOptionBoxes = x - mouse_x;
			variableSlotOptionBox.y = y + (scrollingSurfacePortY - scrollingSurfaceDrawY) + ((slotThatMouseIsOver + 1) * 16) - 9999;
				
			switch (currentScreen){
				case "watchList":
					var arrayIndex = varWatchList[slotThatMouseIsOver,2];
					var instanceScope = varWatchList[slotThatMouseIsOver,3] != noone ? varWatchList[slotThatMouseIsOver,3] : debugInstance;
					var arrayId = (instanceScope != global) ? variable_instance_get(instanceScope, varWatchList[slotThatMouseIsOver,0]) : variable_global_get(varWatchList[slotThatMouseIsOver,0]);
					var isArray = is_array(arrayId);
					var is1DArray = true;
					var arrayFirstDimensionIndex = varWatchList[variableSlotForOptionBox,2];
					var arrayCollapsed = varWatchList[slotThatMouseIsOver,1];
				
					if (!isArray){
						//REGULAR VARIABLE
						scr_ui_option_box_add_option(variableSlotOptionBox, "Remove Variable", id, GLOBAL_INFO_BOX_OPTION_TYPES.none);
						scr_ui_option_box_add_option(variableSlotOptionBox, "Change Value", id, GLOBAL_INFO_BOX_OPTION_TYPES.none);
					}else if (is1DArray){
						//1D Arrays
						if (arrayFirstDimensionIndex == -1){
							scr_ui_option_box_add_option(variableSlotOptionBox, "Remove Variable", id, GLOBAL_INFO_BOX_OPTION_TYPES.none);
							var optionString = (arrayCollapsed == true) ? "Expand" : "Collapse";
					
							scr_ui_option_box_add_option(variableSlotOptionBox, optionString, id, GLOBAL_INFO_BOX_OPTION_TYPES.none);	
						}else if (!arrayCollapsed){
							scr_ui_option_box_add_option(variableSlotOptionBox, "Change Value", id, GLOBAL_INFO_BOX_OPTION_TYPES.none);	
						}
					}else{
						//2D ARRAYS
						var array2ndDimensionIsCollapsed = varWatchList[slotThatMouseIsOver,5];		
						var arrayFirstDimensionIndex = varWatchList[slotThatMouseIsOver,2];
				
						if (arrayFirstDimensionIndex != -1){
							var optionString = (array2ndDimensionIsCollapsed == true) ? "Expand" : "Collapse";
				
							scr_ui_option_box_add_option(variableSlotOptionBox, optionString, id, GLOBAL_INFO_BOX_OPTION_TYPES.none);
						}else{
							scr_ui_option_box_add_option(variableSlotOptionBox, "Remove Variable", id, GLOBAL_INFO_BOX_OPTION_TYPES.none);
							var optionString = (arrayCollapsed == true) ? "Expand" : "Collapse";
					
							scr_ui_option_box_add_option(variableSlotOptionBox, optionString, id, GLOBAL_INFO_BOX_OPTION_TYPES.none);
						}
				
						if (!arrayCollapsed && arrayFirstDimensionIndex != -1){
							scr_ui_option_box_add_option(variableSlotOptionBox, "Change Value", id, GLOBAL_INFO_BOX_OPTION_TYPES.none);
						}
					}
			
					if (arrayFirstDimensionIndex != -1 || !isArray){
						scr_ui_option_box_add_option(variableSlotOptionBox, "Add Comment", id, GLOBAL_INFO_BOX_OPTION_TYPES.none);
						scr_ui_option_box_add_option(variableSlotOptionBox, "Mark as bool", id, GLOBAL_INFO_BOX_OPTION_TYPES.none);
					}
				break;
				
				case "saveLayouts":
					scr_ui_option_box_add_option(variableSlotOptionBox, "Override Layout", id, GLOBAL_INFO_BOX_OPTION_TYPES.none);	
					scr_ui_option_box_add_option(variableSlotOptionBox, "Delete Layout", id, GLOBAL_INFO_BOX_OPTION_TYPES.none);	
				break;
				
				case "loadLayouts":
					scr_ui_option_box_add_option(variableSlotOptionBox, "Load Layout", id, GLOBAL_INFO_BOX_OPTION_TYPES.none);	
					scr_ui_option_box_add_option(variableSlotOptionBox, "Delete Layout", id, GLOBAL_INFO_BOX_OPTION_TYPES.none);		
				break;
			}
		}
	}	
		
	//Check for optionbox clicks
	if (instance_exists(variableSlotOptionBox)){
		variableSlotOptionBox.y = y + (scrollingSurfacePortY - scrollingSurfaceDrawY) + ((variableSlotForOptionBox + 1) * 16) - 8;
		variableSlotOptionBox.x = x - mouseXOffsetForOptionBoxes;
		
		if (variableSlotOptionBox.optionActivate != -1){
			switch (currentScreen){
				case "watchList":
					var varWatchListSecondDimensionSize = array_length_2d(varWatchList, 0);
					var variableStringName = varWatchList[variableSlotForOptionBox,0];
					var instanceScope = varWatchList[variableSlotForOptionBox,3] != noone ? varWatchList[variableSlotForOptionBox,3] : debugInstance;
					var arrayId = (instanceScope != global) ? variable_instance_get(instanceScope, varWatchList[slotThatMouseIsOver,0]) : variable_global_get(varWatchList[slotThatMouseIsOver,0]);
					var isArray = is_array(arrayId);
					var is1DArray = true;
					var arrayFirstDimensionIndex = varWatchList[variableSlotForOptionBox,2];
					var arrayFirstDimensionSize = is1DArray == true ? array_length(arrayId) : array_height_2d(arrayId);
					var arraySecondDimensionIndex = varWatchList[variableSlotForOptionBox,4]; 
					var arraySecondDimensionSize = is1DArray == false ? array_length_2d(arrayId, arrayFirstDimensionIndex) : 0; 
					var commentStringOrDsGridId = varWatchList[variableSlotForOptionBox,6];
				break;
				
				case "loadLayouts":
				case "saveLayouts":
					var fullLayoutPath = working_directory + "Debug Windows/Layouts/" + object_get_name(debugInstance.object_index) + "/";
				break;
			}
				
			//Check what option was pressed
			var optionThatIsActivatedString = variableSlotOptionBox.optionArray[variableSlotOptionBox.optionActivate,0];
			
			switch(optionThatIsActivatedString){
				
				#region Watchlist
					#region Remove Variable
					case "Remove Variable":
						if (!isArray){
							debug_window_clear_watchlist_slot(variableSlotForOptionBox);
						
							scr_array_sort_2d("-00", varWatchList);
						
							varWatchListSize --;
							slotLinesToDraw = varWatchListSize;
						}else{
							//Make sure that all of the second dimension indexs are gonna be collapsed with the rest
							var extraCollapse = 0;
							var arrayCompletelyCollapsed = varWatchList[variableSlotForOptionBox,1];
						
							if (commentStringOrDsGridId != ""){
								if (ds_exists(commentStringOrDsGridId,ds_type_grid)){
									ds_grid_destroy(commentStringOrDsGridId);		
								}
							}
							
							for (i = variableSlotForOptionBox + 1; i < 500; i++){
								if (varWatchList[i,0] == variableStringName && varWatchList[i,4] != 0){
									extraCollapse++;	
								}
								
								if (varWatchList[i,0] == "-00"){
									break;	
								}
							}
							
							for (i = variableSlotForOptionBox; i < arrayFirstDimensionSize + variableSlotForOptionBox + 2 + extraCollapse; i++){
								if (varWatchList[i,0] == variableStringName){
									debug_window_clear_watchlist_slot(i);
								}else{
									break;	
								}
							}
							
							scr_array_sort_2d("-00", varWatchList);
						
							if (arrayCompletelyCollapsed){
								varWatchListSize--;	
							}else{
								varWatchListSize -= arrayFirstDimensionSize + 1 + extraCollapse;	
							}
						
							slotLinesToDraw = varWatchListSize;
						}
					
						if (addingNewVariable){
							varWatchListSize --;
							slotLinesToDraw = varWatchListSize;
						}
					
						addingNewVariable = false;
						addingNewComment = false;
					
					break;
					#endregion
				
					#region Change Value
					case "Change Value":
						variableSlotChangingValue = true;
						keyboard_string = "";
						global.typing = true;
					
						variableSlotToChange = variableSlotForOptionBox;	
					
						if (addingNewVariable){
							varWatchListSize --;
							slotLinesToDraw = varWatchListSize;
						}
					
						addingNewVariable = false;
						addingNewComment = false;
					break;
					#endregion
				
					#region Expand
					case "Expand":
						#region Expanding 1D arrays
						if (is1DArray){
							varWatchList[variableSlotForOptionBox,1] = !varWatchList[variableSlotForOptionBox,1];	
					
							//Find how many slots need to be moved
							var slotsNeededToBeMoved = 0;
					
							for (i = variableSlotForOptionBox + 1; i < 500; i++){
								if (varWatchList[i,0] != "-00"){
									slotsNeededToBeMoved++;							
								}else{
									break;	
								}
							}
					
							//Move slots back
							if (slotsNeededToBeMoved > 0){	
								for (i = variableSlotForOptionBox + slotsNeededToBeMoved; i > 0; i--){
									for (a = 0; a < varWatchListSecondDimensionSize; a++){
										varWatchList[i + arrayFirstDimensionSize,a] = varWatchList[i,a];
									}
						
									varWatchList[i - 0,0] = "CLEARED FOR ARRAY OVERWRTIE";
						
									slotsNeededToBeMoved --;
						
									if (slotsNeededToBeMoved <= 0){
										break;	
									}
								}
							}
					
							//Fill the empty slots with the array information
							var currentArrayIndex = 0;
					
							for (i = variableSlotForOptionBox + 1; i < arrayFirstDimensionSize + variableSlotForOptionBox + 1; i++){
								for (a = 0; a < varWatchListSecondDimensionSize; a++){
									varWatchList[i,a] = varWatchList[variableSlotForOptionBox,a];
								}
						
								varWatchList[i,2] = currentArrayIndex;
								currentArrayIndex ++;
							}
					
							varWatchListSize += arrayFirstDimensionSize;
							slotLinesToDraw = varWatchListSize;
						}
						#endregion
				
						#region Expanding 2D Arrays
						if (!is1DArray){
							var expanding1stDimension = varWatchList[variableSlotForOptionBox,1] && varWatchList[variableSlotForOptionBox,2] == -1;
						
							#region Expanding First Dimension
							if (expanding1stDimension){
								varWatchList[variableSlotForOptionBox,1] = !varWatchList[variableSlotForOptionBox,1];
							
								//Find how many slots need to be moved
								var slotsNeededToBeMoved = 0;
					
								for (i = variableSlotForOptionBox + 1; i < 500; i++){
									if (varWatchList[i,0] != "-00"){
										slotsNeededToBeMoved++;							
									}else{
										break;	
									}
								}
					
								//Move slots back
								if (slotsNeededToBeMoved > 0){	
									for (i = variableSlotForOptionBox + slotsNeededToBeMoved; i > 0; i--){
										for (a = 0; a < varWatchListSecondDimensionSize; a++){
											varWatchList[i + arrayFirstDimensionSize,a] = varWatchList[i,a];
										}
						
										varWatchList[i - 0,0] = "CLEARED FOR ARRAY OVERWRTIE";
						
										slotsNeededToBeMoved --;
						
										if (slotsNeededToBeMoved <= 0){
											break;	
										}
									}
								}
					
								//Fill the empty slots with the array information
								var currentArrayIndex = 0;
					
								for (i = variableSlotForOptionBox + 1; i < arrayFirstDimensionSize + variableSlotForOptionBox + 1; i++){
									for (a = 0; a < varWatchListSecondDimensionSize; a++){
										varWatchList[i,a] = varWatchList[variableSlotForOptionBox,a];
									}
						
									varWatchList[i,2] = currentArrayIndex;
									currentArrayIndex ++;
								}
					
								varWatchListSize += arrayFirstDimensionSize;
								slotLinesToDraw = varWatchListSize;		
							}
							#endregion
						
							#region Expanding Second Dimension
							if (!expanding1stDimension){
								varWatchList[variableSlotForOptionBox,5] = !varWatchList[variableSlotForOptionBox,5];
							
								//Find how many slots need to be moved
								var slotsNeededToBeMoved = 0;
					
								for (i = variableSlotForOptionBox + 1; i < 500; i++){
									if (varWatchList[i,0] != "-00"){
										slotsNeededToBeMoved++;							
									}else{
										break;	
									}
								}
					
								//Move slots back
								if (slotsNeededToBeMoved > 0){	
									for (i = variableSlotForOptionBox + slotsNeededToBeMoved; i > 0; i--){
										for (a = 0; a < varWatchListSecondDimensionSize; a++){
											varWatchList[i + arraySecondDimensionSize - 1,a] = varWatchList[i,a];
										}
						
										varWatchList[i - 0,0] = "CLEARED FOR ARRAY OVERWRTIE";
						
										slotsNeededToBeMoved --;
						
										if (slotsNeededToBeMoved <= 0){
											break;	
										}
									}
								}
					
								//Fill the empty slots with the array information
								var currentArrayIndex = 1;
					
								for (i = variableSlotForOptionBox + 1; i < arraySecondDimensionSize + variableSlotForOptionBox; i++){
									for (a = 0; a < varWatchListSecondDimensionSize; a++){
										varWatchList[i,a] = varWatchList[variableSlotForOptionBox,a];
									}
						
									varWatchList[i,4] = currentArrayIndex;
									currentArrayIndex ++;
								}
					
								varWatchListSize += arraySecondDimensionSize - 1;
								slotLinesToDraw = varWatchListSize;		
							}
							#endregion
						}
						#endregion
					
						//Make sure if the user is adding a comment or new variable or comment that it's stopped
						if (addingNewVariable){
							varWatchListSize --;
							slotLinesToDraw = varWatchListSize;
						}
					
						addingNewVariable = false;
						addingNewComment = false;
						
					break; 
					#endregion
				
					#region Collapse
					case "Collapse":
						if (is1DArray){
							varWatchList[variableSlotForOptionBox,1] = !varWatchList[variableSlotForOptionBox,1];
					
							for (i = variableSlotForOptionBox + 1; i < arrayFirstDimensionSize + variableSlotForOptionBox + 1; i++){
								if (varWatchList[i,0] == variableStringName){
									debug_window_clear_watchlist_slot(i);
								}else{
									break;	
								}
							}
					
							scr_array_sort_2d("-00", varWatchList);
							varWatchListSize -= arrayFirstDimensionSize;
							slotLinesToDraw =	varWatchListSize; 
						}else{
							var collapsingArrayComepletely = (arrayFirstDimensionIndex == -1);
						
							if (collapsingArrayComepletely){
								varWatchList[variableSlotForOptionBox,1] = !varWatchList[variableSlotForOptionBox,1];
							
								//Make sure that all of the second dimension indexs are gonna be collapsed with the rest
								var extraCollapse = 0;
							
								for (i = variableSlotForOptionBox + 1; i < 500; i++){
									if (varWatchList[i,0] == variableStringName && varWatchList[i,4] != 0){
										extraCollapse++;	
									}
								
									if (varWatchList[i,0] == "-00"){
										break;	
									}
								}
							
								for (i = variableSlotForOptionBox + 1; i < arrayFirstDimensionSize + variableSlotForOptionBox + 1 + extraCollapse; i++){
									if (varWatchList[i,0] == variableStringName){
										debug_window_clear_watchlist_slot(i);
									}else{
										break;	
									}
								}
							
								scr_array_sort_2d("-00", varWatchList);
								varWatchListSize -= arrayFirstDimensionSize + extraCollapse;
								slotLinesToDraw =	varWatchListSize; 
							}else{
								//Collapsing Second Dimension
								varWatchList[variableSlotForOptionBox,5] = !varWatchList[variableSlotForOptionBox,5];
							
								for (i = variableSlotForOptionBox + 1; i < arraySecondDimensionSize + variableSlotForOptionBox; i++){
									if (varWatchList[i,2] == arrayFirstDimensionIndex){
										debug_window_clear_watchlist_slot(i);
									}else{
										break;	
									}
								}
							
								scr_array_sort_2d("-00", varWatchList);
								varWatchListSize -= arraySecondDimensionSize - 1;
								slotLinesToDraw =	varWatchListSize; 
							}
						}
					
						//Make sure if the user is adding a comment or new variable or comment that it's stopped 
						if (addingNewVariable){
							varWatchListSize --;
							slotLinesToDraw = varWatchListSize;
						}
					
						addingNewVariable = false;
						addingNewComment = false;
					
					break;
					#endregion
				
					#region Add Comment
					case "Add Comment":
						if (addingNewVariable){
							varWatchListSize --;
							slotLinesToDraw = varWatchListSize;
						}
					
						addingNewVariable = false;
						variableSlotChangeCurrentValue = -1;
						variableSlotChangingValue = false;
					
						keyboard_string = "";
						global.typing = true;
						addingNewComment = true;
						addCommentSlot = variableSlotForOptionBox;
					break;
					#endregion
				
					#region Mark as bool
					case "Mark as bool":
						var varString = varWatchList[variableSlotForOptionBox, 0];
						var instanceScope = varWatchList[variableSlotForOptionBox, 3] != noone ? varWatchList[variableSlotForOptionBox, 3] : debugInstance; 
						var varArrayIdOrValue = variable_instance_get(instanceScope, varString);
						var varIsArray = is_array(varArrayIdOrValue);
						var is1DArray = (array_height_2d(varArrayIdOrValue) == 1);
						var arrayFirstDimensionIndex = varWatchList[variableSlotForOptionBox,2];
						var arrayFirstDimensionSize = is1DArray == true ? array_length_1d(varArrayIdOrValue) : array_height_2d(varArrayIdOrValue);
						var arraySecondDimensionIndex = varWatchList[variableSlotForOptionBox,4]; 
						var arraySecondDimensionSize = is1DArray == false ? array_length_2d(varArrayIdOrValue, arrayFirstDimensionIndex) : 0;
						var filePath = working_directory + "Debug Windows/Bools/";
						var fileName = filePath + varString + ".aug";
				
						if (!varIsArray){											
							if (!file_exists(fileName)){
								var fileIndex = file_bin_open(fileName, 1);
								file_bin_write_real(fileIndex, true);
								file_bin_close(fileIndex);
								varWatchList[variableSlotForOptionBox, 8] = true;
							}else{
								file_delete(fileName);	
								varWatchList[variableSlotForOptionBox, 8] = false;
							}
						}else if (arrayFirstDimensionIndex != -1){						
							//Look for existing ds_grid to hold bool markers
							var arrayHeaderIndex = variableSlotForOptionBox - (arrayFirstDimensionIndex + arraySecondDimensionIndex + 1);
							var g = 0;
								
							while (varWatchList[variableSlotForOptionBox - g,2] != -1){
								g++;
							}
								
							var boolDsGridId = varWatchList[variableSlotForOptionBox - g,8];
							//var boolDsGridId = varWatchList[arrayHeaderIndex, 6];
					
							if (boolDsGridId != 0 && ds_exists(boolDsGridId, ds_type_grid)){
								var boolValue = boolDsGridId[# arrayFirstDimensionIndex,arraySecondDimensionIndex];
								boolDsGridId[# arrayFirstDimensionIndex,arraySecondDimensionIndex] = !boolValue;		
						
								//Loop through the commentDs and save all of the comments
								var fileIndex = file_bin_open(fileName, 1);
						
								var firstDimensionSize = ds_grid_width(boolDsGridId);
								var secondDimensionSize = ds_grid_height(boolDsGridId);
						
								for (i = 0; i < firstDimensionSize; i++){
									for (a = 0; a < secondDimensionSize; a++){	
										var boolValue = boolDsGridId[# i,a];
									
										//if (boolValue != 0){
											file_bin_write_real(fileIndex, i);
											file_bin_write_real(fileIndex, a);
											file_bin_write_real(fileIndex, boolValue); 
											sm(i, a, boolValue);
										//}
									}
								}
						
								file_bin_close(fileIndex);
							}else if (boolDsGridId == 0){
								varWatchList[arrayHeaderIndex, 8] = ds_grid_create(arrayFirstDimensionSize + 1, arraySecondDimensionSize + 1);
								boolDsGridId = varWatchList[arrayHeaderIndex, 8]; //helpwtfkillmepols
							
								if (ds_exists(boolDsGridId,ds_type_grid)){
									boolDsGridId[# arrayFirstDimensionIndex,arraySecondDimensionIndex] = true;	
							
									//Save comment (This assumes there has never been a commment made on this array)
									var fileIndex = file_bin_open(fileName, 1);
							
									file_bin_write_real(fileIndex, arrayFirstDimensionIndex);
									file_bin_write_real(fileIndex, arraySecondDimensionIndex);
									file_bin_write_real(fileIndex, true);
									file_bin_close(fileIndex);
									//sdbm(arrayFirstDimensionIndex, arraySecondDimensionIndex, addCommentString);
								}
							}
						}
					break;
					#endregion
				#endregion
				
				#region Layouts
					
					#region Save layout
					case "Override Layout":
						var layoutSting = layoutArray[variableSlotForOptionBox];	
		
						var fileIndex = file_bin_open(fullLayoutPath + layoutSting + ".aug", 1);
						var watchListSize = array_length_2d(varWatchListSize, 0);		
						
						for (i = 0; i < varWatchListSize; i++){
							var varString = varWatchList[i,0];
							var scopeString = varWatchList[i,7];	
				
							if (varString != "-00" && (string_has_letters(scopeString) || (scopeString == ""))){
								file_bin_write_string(fileIndex, varString);		
								file_bin_write_string(fileIndex, scopeString);
							}else{
								break;
							}
						}
		
			file_bin_close(fileIndex);
					break;
					
					#endregion
					
					#region Load Layout
					case "Load Layout":
						//Clear var watchlist
						for (i = 0; i < varWatchListSize; i++){
							debug_window_clear_watchlist_slot(i);
						}
						
						varWatchListSize = 0;
							
						var loadLayoutString = layoutArray[variableSlotForOptionBox];
						var fullLoadLayoutFilePath = fullLayoutPath + loadLayoutString + ".aug"; 
						
						if (file_exists(fullLoadLayoutFilePath)){
							var layoutFile = file_bin_open(fullLoadLayoutFilePath, 0);
							file_bin_seek(layoutFile, 0);
							
							var a = 0;
							
							while (file_bin_position(layoutFile) < file_bin_size(layoutFile)){
								file_bin_seek(layoutFile, file_bin_position(layoutFile) + 1); //Skip indicator
								var varString = file_bin_read_string(layoutFile);
								file_bin_seek(layoutFile, file_bin_position(layoutFile) + 1); //Skip indicator
								var varScopeString = file_bin_read_string(layoutFile);
								
								//take off the period of the scope string
								varScopeString = string_copy(varScopeString, 1, string_length(varScopeString) - 1);
								
								varWatchList[a,0] = varString;
								
								#region Add the scope if there is one
								var varScopeReal = noone;
			
								switch(varScopeString){
									case "global":
										varScopeReal = global;	
									break;
								}
			
								//If the scope wasn't global
								if (varScopeReal == noone && varScopeString != ""){
									//See if it's an instance id
									if (!string_has_letters(varScopeString)){
										var instId = real(varScopeString);
					
										if (instance_exists(instId)){
											varScopeReal = instId;	
										}
									}else{
										//See if the scope is an inst id held in an instance var
										var scopeVarExists = variable_instance_exists(debugInstance, varScopeString);
										var scopeVarValue = (scopeVarExists) ? variable_instance_get(debugInstance, varScopeString) : noone;
					
										if (instance_exists(scopeVarValue)){
											varScopeReal = scopeVarValue;	
										}
					
										//See if the scope is an object_index
										var objectIndex = asset_get_index(varScopeString);
					
										if (objectIndex != -1){
											if (instance_exists(objectIndex)){
												varScopeReal = objectIndex.id;	
											}
										}
									}
								}
								
								if (varScopeString != ""){
									varWatchList[a, 3] = varScopeReal;
									varWatchList[a, 7] = varScopeString + ".";
								}
								#endregion 
								
								#region Load comments if they exist
								var commentFilePath = working_directory + "Debug Windows/Comments/";
								var varValueOrId = (varScopeReal == global) ? variable_global_get(varString) : variable_instance_get(((varScopeReal !=  noone) ? varScopeReal : debugInstance), varString); 
								var varIsArray = is_array(varValueOrId);
								var is1DArray = (array_height_2d(varValueOrId) == 1);
								var arrayFirstDimensionSize = is1DArray == true ? array_length_1d(varValueOrId) : array_height_2d(varValueOrId);
								var arraySecondDimensionSize = is1DArray == false ? array_length_2d(varValueOrId, 0) : 0;
								var fileName = varString + ".aug"
								
								if (!varIsArray){
									//Regular vars
									if (file_exists(commentFilePath + fileName)){
										var fileIndex = file_bin_open(commentFilePath + fileName,0);
										file_bin_seek(fileIndex, 1); //Because we do not care about INDICATOR
										var commentString = file_bin_read_string(fileIndex)
										file_bin_close(fileIndex);	
					
										varWatchList[a, 6] = commentString;
									}
								}else{
									//ARRAYS-------------------
									if (file_exists(commentFilePath + fileName)){
										var commentDsGridId = ds_grid_create(arrayFirstDimensionSize + 1, arraySecondDimensionSize + 1);
										varWatchList[a, 6] = commentDsGridId;
										var fileIndex = file_bin_open(commentFilePath + fileName, 0);
										file_bin_seek(fileIndex, 0);
										var fileSize = file_bin_size(fileIndex);
						
										while (file_bin_position(fileIndex) < file_bin_size(fileIndex)){	
											file_bin_seek(fileIndex, file_bin_position(fileIndex) + 1); //Skip INDICATOR
											var firstDimensionIndex = file_bin_read_real(fileIndex); //Read first dimension index
											file_bin_seek(fileIndex, file_bin_position(fileIndex) + 1); //Skip INDICATOR
											var secondDimensionIndex = file_bin_read_real(fileIndex); //Read second dimension index 
											file_bin_seek(fileIndex, file_bin_position(fileIndex) + 1); //Skip INDICATOR
											var commentString = file_bin_read_string(fileIndex); //Read the comment string
							
											if (ds_exists(commentDsGridId, ds_type_grid)){
												//sm(firstDimensionIndex, secondDimensionIndex, commentString);
												commentDsGridId[# firstDimensionIndex, secondDimensionIndex] = commentString;	
											}
										}
						
										file_bin_close(fileIndex);
									}
								}
								#endregion
								
								#region Load bool markers if they exist
								var boolMarkerFilePath = working_directory + "Debug Windows/Bools/";
								var fileName = varString + ".aug"
								
								if (!varIsArray){
									//Regular vars
									if (file_exists(boolMarkerFilePath + fileName)){
										varWatchList[a, 8] = true;
									}
								}else{
									//ARRAYS-------------------
									if (file_exists(boolMarkerFilePath + fileName)){
										var boolDsGridId = ds_grid_create(arrayFirstDimensionSize + 1, arraySecondDimensionSize + 1);
										varWatchList[a, 8] = boolDsGridId;
										var fileIndex = file_bin_open(boolMarkerFilePath + fileName, 0);
										file_bin_seek(fileIndex, 0);
										var fileSize = file_bin_size(fileIndex);
						
										while (file_bin_position(fileIndex) < file_bin_size(fileIndex)){	
											file_bin_seek(fileIndex, file_bin_position(fileIndex) + 1); //Skip INDICATOR
											var firstDimensionIndex = file_bin_read_real(fileIndex); //Read first dimension index
											file_bin_seek(fileIndex, file_bin_position(fileIndex) + 1); //Skip INDICATOR
											var secondDimensionIndex = file_bin_read_real(fileIndex); //Read second dimension index 
											file_bin_seek(fileIndex, file_bin_position(fileIndex) + 1); //Skip INDICATOR
											var boolValue = file_bin_read_real(fileIndex); //Read the comment string
							
											if (ds_exists(boolDsGridId, ds_type_grid)){
												//sm(firstDimensionIndex, secondDimensionIndex, commentString);
												boolDsGridId[# firstDimensionIndex, secondDimensionIndex] = boolValue;	
											}
										}
						
										file_bin_close(fileIndex);
									}
								}
								#endregion
								
								varWatchListSize ++;
								a++;
							}
							
							file_bin_close(layoutFile);
							
							currentScreen = "watchList";
						}
					break;
					#endregion
					
					#region Delete Layout
					case "Delete Layout":
						var layoutFileName = fullLayoutPath + layoutArray[variableSlotForOptionBox] + ".aug";
						
						if (file_exists(layoutFileName)){
							file_delete(layoutFileName)		
						}
					
						layoutArray[variableSlotForOptionBox] = "-00";
						array_sort_1d("-00", layoutArray);
						
						layoutArraySize --;						
					break;
					#endregion
				
				#endregion
			}
			
			if (surface_exists(scrollingSurface)){
				surface_free(scrollingSurface);	
			}
			
			instance_destroy(variableSlotOptionBox);
		}
	}else{
		variableSlotForOptionBox = -1;	
	}

#endregion	

#region Double Click to change value

if (slotThatMouseIsOver != -1 && mouseIsntTooFarToTheRight && mouseIsInsideWindow && global.doubleClickLeft){
	var varString = varWatchList[slotThatMouseIsOver, 0];
	var instanceScope = varWatchList[slotThatMouseIsOver, 3] != noone ? varWatchList[slotThatMouseIsOver, 3] : debugInstance; 
	var varArrayIdOrValue = (instanceScope != global) ? variable_instance_get(instanceScope, varWatchList[slotThatMouseIsOver,0]) : variable_global_get(varWatchList[slotThatMouseIsOver,0]);
	var varIsArray = is_array(varArrayIdOrValue);
	var arrayIndex = varWatchList[slotThatMouseIsOver,2];
	
	if (arrayIndex != -1 || !varIsArray){
		variableSlotChangingValue = true;
		keyboard_string = "";
		global.typing = true;
					
		variableSlotToChange = slotThatMouseIsOver;	
					
		if (addingNewVariable){
			varWatchListSize --;
			slotLinesToDraw = varWatchListSize;
		}
					
		addingNewVariable = false;
		addingNewComment = false;	
	}
}

#endregion

#region Changing variable value

	if (variableSlotChangingValue){
		variableSlotChangeCurrentValue = keyboard_string;	
		
		if (keyboard_check_pressed(vk_enter)){
			var varString = varWatchList[variableSlotToChange, 0];
			var instanceScope = varWatchList[variableSlotToChange, 3] != noone ? varWatchList[variableSlotToChange, 3] : debugInstance; 
			var varArrayIdOrValue = (instanceScope != global) ? variable_instance_get(instanceScope, varWatchList[variableSlotToChange,0]) : variable_global_get(varWatchList[variableSlotToChange,0]);
			var varIsArray = is_array(varArrayIdOrValue);
			var is1DArray = true;
			var arrayFirstDimensionIndex = varWatchList[variableSlotToChange,2];
			var arrayFirstDimensionSize = is1DArray == true ? array_length(varArrayIdOrValue) : array_height_2d(varArrayIdOrValue);
			var arraySecondDimensionIndex = varWatchList[variableSlotToChange,4]; 
			var arraySecondDimensionSize = is1DArray == false ? array_length_2d(varArrayIdOrValue, arrayFirstDimensionIndex) : 0;
			var varToChangeValue = (varIsArray == false) ? varArrayIdOrValue : (is1DArray == true ? varArrayIdOrValue[arrayFirstDimensionIndex] : varArrayIdOrValue[arrayFirstDimensionIndex,arraySecondDimensionIndex]);
			var varToChangeIsString = string_has_letters(varToChangeValue);
			var valueToChangeToIsString = string_has_letters(variableSlotChangeCurrentValue) || variableSlotChangeCurrentValue == "";
			var finalValueToSet = ((varToChangeIsString && valueToChangeToIsString) || valueToChangeToIsString) ? variableSlotChangeCurrentValue : real(variableSlotChangeCurrentValue);
			
			if (varToChangeIsString == valueToChangeToIsString && !varIsArray){
				if (instanceScope != global){
					variable_instance_set(instanceScope, varString, finalValueToSet);
				}else{
					variable_global_set(varString, finalValueToSet);		
				}
			}
			
			if (varToChangeIsString == valueToChangeToIsString && varIsArray){
				if (is1DArray){
					varArrayIdOrValue[@ arrayFirstDimensionIndex] = finalValueToSet;	
				}else{
					varArrayIdOrValue[@ arrayFirstDimensionIndex,arraySecondDimensionIndex] = finalValueToSet;		
				}
			}
				
			if (surface_exists(scrollingSurface)){
				surface_free(scrollingSurface);	
			}
		
			variableSlotChangingValue = false;	
			global.typing = false;
		}
	}

#endregion












