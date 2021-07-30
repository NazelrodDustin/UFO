event_inherited();

if (!instance_exists(debugInstance)){
	instance_destroy();	
	exit;
}

var mouseIsntTooFarToTheRight = position_meeting(mouse_x + 25, mouse_y, backingInstance);
var mouseIsInsideWindow = position_meeting(mouse_x, mouse_y, backingInstance); 

#region Draw variable info to surface
	if (!surface_exists(scrollingSurface)){
		scrollingSurfaceHeight = ((slotLinesToDraw + 0) * 16) + 50;
			
		if (scrollingSurfaceHeight < scrollingSurfacePortHeight){
			scrollingSurfaceHeight = scrollingSurfacePortHeight;		
		}
			
		scrollingPortToSurfaceRatio = scrollingSurfaceHeight / scrollingSurfacePortHeight;
		//show_message(scrollingPortToSurfaceRatio);
		scrollBarHeight = scrollingSurfacePortHeight / scrollingPortToSurfaceRatio
		
		if (scrollBarHeight >= scrollingSurfacePortHeight){
			drawScrollBar = false;	
			scrollingSurfaceDrawY = 0;
		}else{
			drawScrollBar = true;	
		} 
		
		scrollingSurface = surface_create(scrollingSurfaceWidth, scrollingSurfaceHeight);
	}
	
	if (scrollingSurfaceUpdate){
		surface_set_target(scrollingSurface);
			draw_clear_alpha(c_black, 0);
			//draw lines for the slots
			var yy = 12;
			
			switch (currentScreen){
				case "watchList":
					slotLinesToDraw = varWatchListSize;
				break;
				
				case "saveLayouts":
				case "loadLayouts":
					slotLinesToDraw = layoutArraySize;
				break;
			}
			
			for (i = 0; i < slotLinesToDraw; i++){
				draw_line_color(-1, yy, scrollingSurfaceWidth - 5, yy, c_gray, c_gray);		
				yy += 16;
			}  
			
			//Draw variable watches 
			yy = 0;
			var xx = 0;
			
			switch (currentScreen){
				case "watchList":
					#region Draw watchList
					for (i = 0; i < varWatchListSize; i++){
						if ((yy >= scrollingSurfaceDrawY) && (yy <=  scrollingSurfaceDrawY + scrollingSurfaceHeight)){ 	
							var variableStringName = varWatchList[i,0];
							var instanceScope = varWatchList[i,3] != noone ? varWatchList[i,3] : debugInstance; //For future use
							var variableExists = (instanceScope == global) ? variable_global_exists(variableStringName) : variable_instance_exists(instanceScope, variableStringName);
				
							if (variableExists){
								var slotTextColor = ((variableSlotForOptionBox != -1 && i == variableSlotForOptionBox) || (slotBeingDragged && i == slotBeingDraggedIndex)) ? c_red : c_white;
								var variableValue = (instanceScope == global) ? variable_global_get(variableStringName) : variable_instance_get(instanceScope, variableStringName);
								var varValueIsString = string_has_letters(string(variableValue));
								var valueStringToDraw = (varValueIsString == true) ? ((variableSlotChangingValue && i == variableSlotToChange) ? chr(34) + string(variableSlotChangeCurrentValue) + chr(34) : chr(34) + string(variableValue) + chr(34) ) : ((variableSlotChangingValue && i == variableSlotToChange) ? string(variableSlotChangeCurrentValue) : string(variableValue));
								var variableIsAnArray = is_array(variableValue);
								var arrayIndex = varWatchList[i,2];
								var array2ndDimensionIndex = varWatchList[i,4];
								var scopeString = varWatchList[i,7];
					
								var scopeStringWidth = string_width(scopeString);
					
								if (!variableIsAnArray){
									var isMarkedAsBool = varWatchList[i,8];
							
									if (isMarkedAsBool && !varValueIsString){
										switch (valueStringToDraw){
											case "0":
												valueStringToDraw = "False";
											break;
									
											case "1": 
												valueStringToDraw = "true";
											break;
										}
									}
							
									if (variableSlotChangingValue && i == variableSlotToChange){
										variableValue = variableSlotChangeCurrentValue; 		
									}
						
									var nameStringWidth = string_width(variableStringName) + scopeStringWidth;
									var namePlusEqualsWidth = string_width(" = ") + nameStringWidth;
									var widthAfterValue = string_width(valueStringToDraw) + namePlusEqualsWidth;
					
									draw_text_ext_color(xx, yy, scopeString, 16, scrollingSurfaceWidth, c_blue, c_blue, c_blue, c_blue, 1);
									draw_text_ext_color(xx + scopeStringWidth, yy, variableStringName, 16, scrollingSurfaceWidth, slotTextColor, slotTextColor, slotTextColor, slotTextColor, 1);	
									draw_text_ext_color(xx + nameStringWidth, yy, " = ", 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, 1);
									draw_text_ext_color(xx + namePlusEqualsWidth, yy, valueStringToDraw, 16, scrollingSurfaceWidth, c_orange, c_orange, c_orange, c_orange, 1);	
						
									var commentString = varWatchList[i,6];
						
									if (commentString != "" && addCommentSlot != i){
										draw_text_ext_color(xx + widthAfterValue, yy, "    //" + commentString, 16, scrollingSurfaceWidth, c_green, c_green, c_green, c_green, 1);	
									}else if (addingNewComment && addCommentSlot == i){
										var widthAfterComment = string_width("    //" + addCommentString) + widthAfterValue;
										draw_text_ext_color(xx + widthAfterValue, yy, "    //" + addCommentString, 16, scrollingSurfaceWidth, c_green, c_green, c_green, c_green, 1);	
										draw_text_ext_color(xx + widthAfterComment, yy, "_", 16, scrollingSurfaceWidth, c_green, c_green, c_green, c_green, alphaForInputs);
									}
								}else{
									//Arrays
									var is1DArray = (true);		
						
									//1D ARRAYS ----------------------------------------1D Arrays-----------------------------------------------------1D Arrays-----------------------------------------------------1D Arrays-----------------------------------------------------1D Arrays-------------
									if (is1DArray){
										var arrayIsCollapsed = varWatchList[i,1];
							
										if (arrayIsCollapsed){
											var nameStringWidth = string_width(variableStringName) + scopeStringWidth;
											var nameStringPlusOpeningBracketWidth = string_width(" [") + nameStringWidth;
								
											draw_text_ext_color(xx, yy, scopeString, 16, scrollingSurfaceWidth, c_blue, c_blue, c_blue, c_blue, 1);
											draw_text_ext_color(xx + scopeStringWidth, yy, variableStringName, 16, scrollingSurfaceWidth, slotTextColor, slotTextColor, slotTextColor, slotTextColor, 1);	
											draw_text_ext_color(xx + nameStringWidth, yy, " [  ] 1D Array ", 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, 1);
											draw_text_ext_color(xx + nameStringPlusOpeningBracketWidth, yy, "+", 16, scrollingSurfaceWidth, c_orange, c_orange, c_orange, c_orange, 1);
										}else{
											if (arrayIndex == -1){
												var nameStringWidth = string_width(variableStringName) + scopeStringWidth;
												var nameStringPlusOpeningBracketWidth = string_width(" [") + nameStringWidth;
								
												draw_text_ext_color(xx, yy, scopeString, 16, scrollingSurfaceWidth, c_blue, c_blue, c_blue, c_blue, 1);
												draw_text_ext_color(xx + scopeStringWidth, yy, variableStringName, 16, scrollingSurfaceWidth, slotTextColor, slotTextColor, slotTextColor, slotTextColor, 1);	
												draw_text_ext_color(xx + nameStringWidth, yy, " [  ] 1D Array ", 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, 1);
												draw_text_ext_color(xx + nameStringPlusOpeningBracketWidth, yy, "-", 16, scrollingSurfaceWidth, c_orange, c_orange, c_orange, c_orange, 1);	
											}else{
												var arrayValueToDraw = (varValueIsString == true) ? ((variableSlotChangingValue && i == variableSlotToChange) ? chr(34) + string(variableSlotChangeCurrentValue) + chr(34) : chr(34) + string(variableValue[@ arrayIndex]) + chr(34)) : ((variableSlotChangingValue && i == variableSlotToChange) ? string(variableSlotChangeCurrentValue) : string(variableValue[@ arrayIndex]));
										
												var boolDsGridId = varWatchList[i - (arrayIndex + 1),8];
										
												if (ds_exists(boolDsGridId, ds_type_grid)){
													var isMarkedAsBool = boolDsGridId[# arrayIndex,0];
							
													if (isMarkedAsBool){
														switch (arrayValueToDraw){
															case "0":
																arrayValueToDraw = "False";
															break;
									
															case "1": 
																arrayValueToDraw = "true";
															break;
														}
													}
												}
										
												var indentionWidth = string_width("- ");
												var indentionScopeWidth = indentionWidth + scopeStringWidth;
												var nameStringPlusIndentionWidth = string_width(variableStringName) + indentionScopeWidth;
												var nameStringPlusIndentionPlusOpeningBracketWidth = string_width(" [") + nameStringPlusIndentionWidth;
												var nameStringPlusIndentionPlusOpeningBracketPlusClosingAndEqualsWidth = string_width(string(arrayIndex)) + nameStringPlusIndentionPlusOpeningBracketWidth;
												var widthAfterValue = string_width(arrayValueToDraw + "] = ") + nameStringPlusIndentionPlusOpeningBracketPlusClosingAndEqualsWidth;
	
												draw_text_ext_color(xx, yy, "- ", 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, 1);
												draw_text_ext_color(xx + indentionWidth, yy, scopeString, 16, scrollingSurfaceWidth, c_blue, c_blue, c_blue, c_blue, 1);
												draw_text_ext_color(xx + indentionScopeWidth, yy, variableStringName, 16, scrollingSurfaceWidth, slotTextColor, slotTextColor, slotTextColor, slotTextColor, 1);		
												draw_text_ext_color(xx + nameStringPlusIndentionWidth, yy, " [", 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, 1);
												draw_text_ext_color(xx + nameStringPlusIndentionPlusOpeningBracketWidth, yy, string(arrayIndex) + "     " + arrayValueToDraw , 16, scrollingSurfaceWidth, c_orange, c_orange, c_orange, c_orange, 1);
												draw_text_ext_color(xx + nameStringPlusIndentionPlusOpeningBracketPlusClosingAndEqualsWidth, yy, "] = ", 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, 1);
									
												var commentDsGridId = varWatchList[i - (arrayIndex + 1),6];
									
												if (commentDsGridId != "" && (addCommentSlot != i) && is_real(commentDsGridId)){
													if (ds_exists(commentDsGridId, ds_type_grid)){
														var commentString = string(commentDsGridId[# arrayIndex,0]);
											
														if (commentString != "0"){
															draw_text_ext_color(xx + widthAfterValue, yy, "    //" + commentString, 16, scrollingSurfaceWidth, c_green, c_green, c_green, c_green, 1);
														}
													}
												}else if (addingNewComment && addCommentSlot == i){
													var widthAfterComment = string_width("    //" + addCommentString) + widthAfterValue;
													draw_text_ext_color(xx + widthAfterValue, yy, "    //" + addCommentString, 16, scrollingSurfaceWidth, c_green, c_green, c_green, c_green, 1);	
													draw_text_ext_color(xx + widthAfterComment, yy, "_", 16, scrollingSurfaceWidth, c_green, c_green, c_green, c_green, alphaForInputs);
												}
											}
										}
									}else{
										//2D ARRAYS	---------------------------------2D Arrays-------------------------------------------------------------2D Arrays-------------------------------------------------------------2D Arrays----------------------------
										var arrayIsCompletelyCollapsed = varWatchList[i,1];
										var arraySecondDimensionCollapsed = varWatchList[i,5];
										var addedIndention = (arraySecondDimensionCollapsed == false) ? "- " : "";
							
										if (arrayIsCompletelyCollapsed){
											var nameStringWidth = string_width(variableStringName) + scopeStringWidth;
											var nameStringPlusOpeningBracketWidth = string_width(" [") + nameStringWidth;
								
											draw_text_ext_color(xx, yy, scopeString, 16, scrollingSurfaceWidth, c_blue, c_blue, c_blue, c_blue, 1);
											draw_text_ext_color(xx + scopeStringWidth, yy, variableStringName, 16, scrollingSurfaceWidth, slotTextColor, slotTextColor, slotTextColor, slotTextColor, 1);	
											draw_text_ext_color(xx + nameStringWidth, yy, " [  ,   ] 2D Array ", 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, 1);
											draw_text_ext_color(xx + nameStringPlusOpeningBracketWidth, yy, "+  +", 16, scrollingSurfaceWidth, c_orange, c_orange, c_orange, c_orange, 1);
											//draw_text_ext_color(xx, yy, variableStringName + " [+,+] 2D Array ", 16, scrollingSurfaceWidth, slotTextColor, slotTextColor, slotTextColor, slotTextColor, 1);		
										}else if (arrayIndex != -1){
											var arrayValueToDraw = (varValueIsString == true) ? ((variableSlotChangingValue && i == variableSlotToChange) ? chr(34) + string(variableSlotChangeCurrentValue) + chr(34) : chr(34) + string(variableValue[@ arrayIndex, array2ndDimensionIndex]) + chr(34)) : ((variableSlotChangingValue && i == variableSlotToChange) ? string(variableSlotChangeCurrentValue) : string(variableValue[@ arrayIndex, array2ndDimensionIndex]));
											var boolDsGridId = varWatchList[i - ((arrayIndex + array2ndDimensionIndex) + 1),8];
										
											if (ds_exists(boolDsGridId, ds_type_grid)){
												var isMarkedAsBool = boolDsGridId[# arrayIndex,array2ndDimensionIndex];
							
												if (isMarkedAsBool){
													switch (arrayValueToDraw){
														case "0":
															arrayValueToDraw = "False";
														break;
									
														case "1": 
															arrayValueToDraw = "true";
														break;
													}
												}
											}
									
											var indentionWidth = string_width("- " + addedIndention);
											var indentionScopeWidth = indentionWidth + scopeStringWidth;
											var nameStringPlusIndentionWidth = string_width(variableStringName) + indentionScopeWidth;
											var nameStringPlusIndentionPlusOpeningBracketWidth = string_width(" [") + nameStringPlusIndentionWidth;
											var nameStringPlusIndentionPlusOpeningBracketPlusClosingAndEqualsWidth = string_width(string(arrayIndex)) + nameStringPlusIndentionPlusOpeningBracketWidth;
											var nameIndentionOpeningBracketFirstIndexComma = string_width(" , ") + nameStringPlusIndentionPlusOpeningBracketPlusClosingAndEqualsWidth; 
											var widthAfterSecondIndex = string_width(string(array2ndDimensionIndex)) + nameIndentionOpeningBracketFirstIndexComma;
											var widthAfterEquals = string_width("] = ") + widthAfterSecondIndex;
											var widthAfterValue = string_width(arrayValueToDraw) + widthAfterSecondIndex;
									
											draw_text_ext_color(xx, yy, "- " + addedIndention, 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, 1);
											draw_text_ext_color(xx + indentionWidth, yy, scopeString, 16, scrollingSurfaceWidth, c_blue, c_blue, c_blue, c_blue, 1);
											draw_text_ext_color(xx + indentionScopeWidth, yy, variableStringName, 16, scrollingSurfaceWidth, slotTextColor, slotTextColor, slotTextColor, slotTextColor, 1);		
											draw_text_ext_color(xx + nameStringPlusIndentionWidth, yy, " [", 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, 1);
											draw_text_ext_color(xx + nameStringPlusIndentionPlusOpeningBracketWidth, yy, string(arrayIndex), 16, scrollingSurfaceWidth, c_orange, c_orange, c_orange, c_orange, 1);
											draw_text_ext_color(xx + nameStringPlusIndentionPlusOpeningBracketPlusClosingAndEqualsWidth, yy, " , ", 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, 1);
											draw_text_ext_color(xx + nameIndentionOpeningBracketFirstIndexComma, yy, string(array2ndDimensionIndex), 16, scrollingSurfaceWidth, c_orange, c_orange, c_orange, c_orange, 1);
											draw_text_ext_color(xx + widthAfterSecondIndex, yy, "] = ", 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, 1);
											draw_text_ext_color(xx + widthAfterEquals, yy, arrayValueToDraw, 16, scrollingSurfaceWidth, c_orange, c_orange, c_orange, c_orange, 1);	
								
											var commentDsGridId = varWatchList[i - ((arrayIndex + array2ndDimensionIndex) + 1),6];
								
											var g = 0;
								
											while (varWatchList[i - g,2] != -1){
												g++;
											}
								
											commentDsGridId = varWatchList[i - g,6];
									
											if (is_real(commentDsGridId) && commentDsGridId != "" && (addCommentSlot != i)){
												if (ds_exists(commentDsGridId, ds_type_grid)){
													var commentString = string(commentDsGridId[# arrayIndex,array2ndDimensionIndex]);

													if (commentString != "0" && commentString != ""){
														//show_message(commentString);
														draw_text_ext_color(xx + widthAfterValue, yy, "        //" + commentString, 16, scrollingSurfaceWidth, c_green, c_green, c_green, c_green, 1);
													}
												} //ADDING COMMENTS
											}else if (addingNewComment && addCommentSlot == i){
												var widthAfterComment = string_width("        //" + addCommentString) + widthAfterValue;
												draw_text_ext_color(xx + widthAfterValue, yy, "        //" + addCommentString, 16, scrollingSurfaceWidth, c_green, c_green, c_green, c_green, 1);		
												draw_text_ext_color(xx + widthAfterComment, yy, "_", 16, scrollingSurfaceWidth, c_green, c_green, c_green, c_green, alphaForInputs);
											}
										}else{
											var nameStringWidth = string_width(variableStringName) + scopeStringWidth;
											var nameStringPlusOpeningBracketWidth = string_width(" [") + nameStringWidth;
								
											draw_text_ext_color(xx, yy, scopeString, 16, scrollingSurfaceWidth, c_blue, c_blue, c_blue, c_blue, 1);
											draw_text_ext_color(xx + scopeStringWidth, yy, variableStringName, 16, scrollingSurfaceWidth, slotTextColor, slotTextColor, slotTextColor, slotTextColor, 1);	
											draw_text_ext_color(xx + nameStringWidth, yy, " [  ,   ] 2D Array ", 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, 1);
											draw_text_ext_color(xx + nameStringPlusOpeningBracketWidth, yy, "-   -", 16, scrollingSurfaceWidth, c_orange, c_orange, c_orange, c_orange, 1);
											//draw_text_ext_color(xx, yy, variableStringName + " [-,-] 2D Array ", 16, scrollingSurfaceWidth, slotTextColor, slotTextColor, slotTextColor, slotTextColor, 1);		
										}
									}
								}
							}else if (variableStringName == "-00" && addingNewVariable){
								var widthAfterAddString = string_width(addVariableString);
								draw_text_ext_color(xx, yy, addVariableString, 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, 1);	
								draw_text_ext_color(xx + widthAfterAddString, yy, "_", 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, alphaForInputs);
								break;
							}
						}
				
						if ((yy > scrollingSurfaceDrawY + scrollingSurfacePortHeight)){
							break;		
						}
				
						yy += 16
					}
					#endregion
				break;
				
				case "saveLayouts":
				case "loadLayouts":
					for (i = 0; i < layoutArraySize; i++){
						var layoutString = layoutArray[i];
						var layoutStringColor = (variableSlotForOptionBox == i) ? c_red : c_white;
					
						if (layoutString != "-00"){
							draw_text_ext_color(xx, yy, layoutString, 16, scrollingSurfaceWidth, layoutStringColor, layoutStringColor, layoutStringColor, layoutStringColor, 1);
						}else if (layoutString == "-00" && savingLayout){
							var widthAfterAddString = string_width(keyboard_string);
							draw_text_ext_color(xx, yy, keyboard_string, 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, 1);	
							draw_text_ext_color(xx + widthAfterAddString, yy, "_", 16, scrollingSurfaceWidth, c_yellow, c_yellow, c_yellow, c_yellow, alphaForInputs);
							break;
						}
						
						yy += 16;
					}
				break;
			}
		surface_reset_target();	
		
		scrollingSurfaceUpdate = false;
		dtUpdate = false;
	}
	#endregion

event_inherited();
var screenArray, screenArraySize;

var saveButtonX = x + 214;
var saveButtonY = y + 20;

var mouseIsOverSaveButton = point_in_rectangle(mouse_x, mouse_y, saveButtonX, saveButtonY, saveButtonX + 16, saveButtonY + 16);

var saveAlpha = (mouseIsOverSaveButton) ? .5 : 1;

draw_sprite_ext(spr_uiDebugLoadSave, 0, saveButtonX, saveButtonY, 1, 1, 0, c_white, saveAlpha);

var loadButtonX = saveButtonX + 17;
var loadButtonY = saveButtonY;

var mouseIsOverLoadButton = point_in_rectangle(mouse_x, mouse_y, loadButtonX, loadButtonY, loadButtonX + 16, loadButtonY + 16);

var loadAlpha = (mouseIsOverLoadButton) ? .5 : 1;

draw_sprite_ext(spr_uiDebugLoadSave, 1, loadButtonX, loadButtonY, 1, 1, 0, c_white, loadAlpha);

draw_line_color(x + 19, y + 36, x + scrollingSurfaceWidth + scrollingSurfacePortX - 4, y + 36, c_ltgray, c_ltgray);	

switch (currentScreen){
	case "watchList":
		var mouseIsOverAddVariableText = point_in_rectangle(mouse_x, mouse_y, x + 20 , y + 332, x + 20 + string_width("+ Add Variable"), y + 340);
		screenArray = varWatchList;
		screenArraySize = varWatchListSize;
		
		draw_text_color(x + 20, y + 26, "Variables", c_yellow, c_yellow, c_yellow, c_yellow, 1);
		var namePlusIdStringWidth = string_width(object_get_name(debugInstance.object_index) + " (" + string(id) + ")");
		draw_text_color(x + (scrollingSurfaceWidth + scrollingSurfacePortX - 4) - namePlusIdStringWidth - 34, y + 26, object_get_name(debugInstance.object_index) + " [" + string(debugInstance.id) + "]", c_yellow, c_yellow, c_yellow, c_yellow, 1);

		var addVariableColor = mouseIsOverAddVariableText == true ? c_red : c_yellow;
		draw_text_color(x + 20, y + 332, "+ Add Variable", addVariableColor, addVariableColor, addVariableColor, addVariableColor, 1);
	break;
	
	case "saveLayouts":
		screenArraySize = layoutArraySize;
		var mouseIsOverSaveLayoutText = point_in_rectangle(mouse_x, mouse_y, x + 20 , y + 332, x + 20 + string_width("+ Save Layout"), y + 340);
		var mouseIsOverBack = point_in_rectangle(mouse_x, mouse_y, x + 14, y + 15, x + 14 + string_width("< Back to watchlist"), y + 23);
		draw_text_color(x + 20, y + 26, "Save Layouts", c_yellow, c_yellow, c_yellow, c_yellow, 1);
		var saveLayoutColor = (mouseIsOverSaveLayoutText == true) ? c_red : c_yellow;
		draw_text_color(x + 20, y + 332, "+ Save Layout", saveLayoutColor, saveLayoutColor, saveLayoutColor, saveLayoutColor, 1);	
		var backColor = mouseIsOverBack == true ? c_red : c_yellow;
		draw_text_color(x + 14, y + 15, "< Back to watchlist", backColor, backColor, backColor, backColor, 1);	
	break;
	
	case "loadLayouts":
		screenArraySize = layoutArraySize;
		var mouseIsOverSaveLayoutText = point_in_rectangle(mouse_x, mouse_y, x + 20 , y + 332, x + 20 + string_width("+ Save Layout"), y + 340);
		var mouseIsOverBack = point_in_rectangle(mouse_x, mouse_y, x + 14, y + 15, x + 14 + string_width("< Back to watchlist"), y + 23);
		draw_text_color(x + 20, y + 26, "Load Layouts", c_yellow, c_yellow, c_yellow, c_yellow, 1);
		var backColor = mouseIsOverBack == true ? c_red : c_yellow;
		draw_text_color(x + 14, y + 15, "< Back to watchlist", backColor, backColor, backColor, backColor, 1);	
	break;
}

if (currentScreen == "saveLayouts" || currentScreen == "loadLayouts"){
	if (mouse_check_button_pressed(mb_left) && mouseIsOverBack){
		currentScreen = "watchList";
	}
}

if (mouse_check_button_pressed(mb_left)){
	if (mouseIsOverSaveButton){
		currentScreen = "saveLayouts"; 	
	}else if (mouseIsOverLoadButton){
		currentScreen = "loadLayouts";	
	}	
	
	if (mouseIsOverSaveButton || mouseIsOverLoadButton){
		addingNewComment = false;
		addingNewVariable = false;
		variableSlotToChange = -1;
	}
}

//Stat box for load/save
if (mouseIsOverLoadButton){
	var loadString = "Load Layout";
	var xOff = string_width(loadString) / 2;
	draw_text(mouse_x - xOff, mouse_y + 8, loadString)	
}

if (mouseIsOverSaveButton){
	var saveString = "Save Layout";
	var xOff = string_width(saveString) / 2;
	draw_text(mouse_x - xOff, mouse_y + 8, saveString)		
}

#region Highlight slots	
	
	if (mouseIsntTooFarToTheRight && mouseIsInsideWindow && !instance_exists(obj_uiOptionBoxGeneral) && (mouse_y > (y + scrollingSurfacePortY))){
		var yy = 0;
		
		for (a = 0; a < screenArraySize; a++){
			var slotX = x + scrollingSurfacePortX;
			var slotY = y + (scrollingSurfacePortY - scrollingSurfaceDrawY) + yy;
			var mouseIsOverSlot = (mouse_y > slotY) && (mouse_y < (slotY + 16));
			
			slotThatMouseIsOver = mouseIsOverSlot == true ? a : -1;
			
			if (mouseIsOverSlot){
				draw_set_alpha(.3);
				 draw_rectangle_color(slotX, slotY - 4, slotX + 225, slotY + 12, c_gray, c_gray, c_gray, c_gray, false);
				draw_set_alpha(1);
				break;
			}else if (a == varWatchListSize){
				slotThatMouseIsOver = -1;
			}
			
			yy += 16;
		}
		
		if (slotBeingDragged && slotBeingDraggedIndex != -1){
			var draggedString = varWatchList[slotBeingDragged,0];
			
			draw_text_color(mouse_x, mouse_y, draggedString, c_yellow, c_yellow, c_yellow, c_yellow, .5);	
		}
	} 

#endregion




