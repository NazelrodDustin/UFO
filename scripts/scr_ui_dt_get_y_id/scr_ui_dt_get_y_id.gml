/// @func scr_ui_dt_get_y_id(x, y, dtStruc, stringId, lineSep, wordSep, w)
/// @desc returns the y pos of a stringId inside of a dtStruc, or -1 if it can't find the id
/// @param xx 
/// @param yy
/// @param dtStruc
/// @param stringId
/// @param lineSep
/// @param wordSep
/// @param w
function scr_ui_dt_get_y_id() {

	var xx = argument[0];
	var yy = argument[1];
	var dtStruc = argument[2];
	var stringId = argument[3];
	var lineSep = argument[4];
	var	wordSep = argument[5]; 
	var w = argument[6];
	var lineCurrent = 0;
	var xxOrg = xx;

	var dtWidth = dtStruc[# 0,0];

	//Start drawing the dynamic text
	for (i = 1; i < dtWidth; i++;){
		var indexString = dtStruc[# i,0];
		var indexId = dtStruc[# i,4];
	
		if (indexString != "-1"){
			//Find the number of words in the string
			var stringCurrent = indexString;
			var stringWidth = string_width(string(stringCurrent));
			var lineBreak = dtStruc[# i,3]; 
		
			//Check to see if the string is longer than the max width allowed on one line
			if (lineCurrent + string_width(stringCurrent) <= w && !lineBreak){
				lineCurrent += wordSep + string_width(string(stringCurrent));
			
				//draw_text_ext_transformed(xx, yy, stringCurrent, lineSep, w, scale, scale, 0);
				if (indexId == stringId){
					return yy 
				}
			
				//click region debug -> draw_rectangle(xx, yy + 2, xx + stringWidth, yy + 16, 1);
				xx += stringWidth + wordSep;
			}else{
				//Start drawing on a new line
				yy += lineSep;	
				xx = xxOrg;
				lineCurrent = stringWidth + wordSep;
			
				if (indexId == stringId){
					return yy 
				}	
			
				draw_set_color(c_black);
				xx += stringWidth + wordSep;
			}
		}else{
			break;		
		}
	}

	return -1;



}
