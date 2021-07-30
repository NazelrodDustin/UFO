/// @func scr_ui_dt_check_click_region_string(x, y, string, dtStruc, lineSep, wordSep, w)
/// @desc returns whether or not the mouse is currently inside of the click region for a given string within a dtStruc
/// @param xx 
/// @param yy
/// @param string
/// @param dtStruc
/// @param lineSep
/// @param wordSep
/// @param w
function scr_ui_dt_check_click_region_string() {

	var xx = argument[0];
	var yy = argument[1];
	var str = argument[2];
	var dtStruc = argument[3];
	var lineSep = argument[4];
	var	wordSep = argument[5]; 
	var w = argument[6];
	var lineCurrent = 0;
	var xxOrg = xx;

	if (!ds_exists(dtStruc, ds_type_grid)){
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
			
				//Check too see if it's the string your trying to check and return whether or not the mouse is in the click region
				if (stringCurrent == str){
					var inRegion = point_in_rectangle(mouse_x, mouse_y, xx, yy + 2, xx + stringWidth, yy + 16);
					if (inRegion){
						return inRegion;
					}
				}
			
				xx += stringWidth + wordSep;
			}else{
				yy += lineSep;	
				xx = xxOrg;
				lineCurrent = stringWidth + wordSep;
			
				//Check too see if it's the string your trying to check and return whether or not the mouse is in the click region
				if (stringCurrent == str){
					var inRegion = point_in_rectangle(mouse_x, mouse_y, xx, yy + 1, xx + stringWidth, yy + 16);
					if (inRegion){
						return inRegion;
					}
				}
			
				xx += stringWidth + wordSep;
			}
		}else{
			return false;		
		}

	}



}
