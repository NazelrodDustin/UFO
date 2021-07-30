/// @func scr_ui_dt_check_click_region_id(x, y, dtStruc, lineSep, wordSep, w)
/// @desc Returns the id of a string that is clicked inside of a dtStruc or -1 if none is clicked
/// @param xx 
/// @param yy
/// @param dtStruc
/// @param lineSep
/// @param wordSep
/// @param w
function scr_ui_dt_check_click_region_id() {

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
		var indexId = dtStruc[# i,4];
	
		if (indexString != "-1"){
			//Init some useful vars
			var stringCurrent = indexString;
			var stringWidth = string_width(stringCurrent);
			var lineBreak = dtStruc[# i,3] ;
		
			//Check to see if the string is longer than the max width allowed on one line
			if (lineCurrent + string_width(stringCurrent) <= w && !lineBreak){
				lineCurrent += wordSep + string_width(stringCurrent);
				//Check too see if the mouse is in the click region for this string
				var inRegion = point_in_rectangle(mouse_x, mouse_y, xx, yy + 2, xx + stringWidth + wordSep, yy + 16);
			
				if (inRegion){
					return indexId;
				}

				xx += stringWidth + wordSep;
			}else{
				yy += lineSep;	
				xx = xxOrg;
				lineCurrent = stringWidth + wordSep;
				//Check too see if it's the string your trying to check and return whether or not the mouse is in the click region
				var inRegion = point_in_rectangle(mouse_x, mouse_y, xx, yy + 1, xx + stringWidth + wordSep, yy + 16);
			
				if (inRegion){
					return indexId;
				}

				xx += stringWidth + wordSep;	
			}
		}else{
			return -1;		
		}

	}



}
