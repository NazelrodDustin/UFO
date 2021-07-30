/// @func scr_ui_dt_get_height(dtStruc, lineSep, wordSep, w)
/// @desc Returns the height in pixels of a dt
/// @param dtStruc
/// @param lineSep
/// @param wordSep
/// @param w
function scr_ui_dt_get_height() {

	var yy = 0;
	var dtStruc = argument[0];
	var lineSep = argument[1];
	var	wordSep = argument[2]; 
	var w = argument[3];
	var lineCurrent = 0;
	var xx = 0;
	var xxOrg = 0;

	if (!ds_exists(dtStruc, ds_type_grid)){
		//show_debug_message("dtStruc does not exist");
		exit;
	}

	var dtWidth = dtStruc[# 0,0];

	//Start drawing the dynamic text
	for (i = 1; i < dtWidth; i++;){
		if (dtStruc[# i,0] != "-1"){
			//Find the number of words in the string
			var stringCurrent = dtStruc[# i,0];
			var stringWidth = string_width(string(stringCurrent));
			var lineBreak = dtStruc[# i,3];
		
			//Check to see if the string is longer than the max width allowed on one line
			if (lineCurrent + string_width(stringCurrent) <= w && !lineBreak){
				//Draw the string if it doesn't need to break to a new line
				lineCurrent += wordSep + string_width(string(stringCurrent));
				
				//click region debug -> draw_rectangle(xx, yy + 2, xx + stringWidth, yy + 16, 1);
				xx += stringWidth + wordSep;
			}else{
				//Start drawing on a new line
				yy += lineSep;	
				xx = xxOrg;
				lineCurrent = stringWidth + wordSep;
				xx += stringWidth + wordSep;	
			}
		}else{
			break;		
		}

	}

	return yy + (lineSep * 2) + 4;


}
