/// @func scr_ui_dt_check_click_region_all(x, y, dtStruc, lineSep, wordSep, w)
/// @desc returns whether or not the mouse is currently inside of the click region for ANY of the strings in a given dtStruc
/// @param xx 
/// @param yy
/// @param dtStruc
/// @param lineSep
/// @param wordSep
/// @param w
function scr_ui_dt_check_click_region_all() {

	var xx = argument[0];
	var yy = argument[1];
	var dtStruc = argument[2];
	var lineSep = argument[3];
	var	wordSep = argument[4]; 
	var w = argument[5];
	var lineCurrent = 0;
	var xxOrg = xx;

	if (!ds_exists(dtStruc, ds_type_grid)){
		//show_debug_message("dtStruc does not exist");
		exit;
	}

	var dtWidth = dtStruc[# 0,0];

	for (i = 1; i < dtWidth; i++;){
		var indexString = dtStruc[# i,0]; 
	
		if (indexString != "-1"){
			//Init some useful vars
			var stringCurrent = indexString;
			var stringWidth = string_width(stringCurrent);
			var lineBreak = dtStruc[# i,3]; 
		
			//Check to see if the string is longer than the max width allowed on one line
			if (lineCurrent + string_width(stringCurrent) <= w && !lineBreak){
				lineCurrent += wordSep + string_width(stringCurrent);
				//Check too see if the mouse is in the click region for this string
				var inRegion = point_in_rectangle(mouse_x, mouse_y, xx, yy + 2, xx + stringWidth, yy + 16);
			
				if (inRegion){
					return inRegion;
				}

				xx += stringWidth + wordSep;
			}else{
				yy += lineSep;	
				xx = xxOrg;
				lineCurrent = stringWidth + wordSep;
				//Check too see if it's the string your trying to check and return whether or not the mouse is in the click region
				var inRegion = point_in_rectangle(mouse_x, mouse_y, xx, yy + 1, xx + stringWidth, yy + 16);
			
				if (inRegion){
					return inRegion;
				}

				xx += stringWidth + wordSep;
			}
		}else{
			return false;		
		}

	}



}
