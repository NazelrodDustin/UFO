/// @func scr_ui_dt_draw(x, y, dtStruc, lineSep, wordSep, w)
/// @desc draws a dtStruc
/// @param xx 
/// @param yy
/// @param dtStruc
/// @param lineSep
/// @param wordSep
/// @param w
function scr_ui_dt_draw() {


	var xx = argument[0];
	var yy = argument[1];
	var dtStruc = argument[2];
	var lineSep = argument[3];
	var	wordSep = argument[4]; 
	var w = argument[5];
	var lineCurrent = 0;
	var xxOrg = xx;

	if (!ds_exists(dtStruc, ds_type_grid)){
		exit;	
	}


	var dtHeight = dtStruc[# 0,0];

	//Start drawing the dynamic text
	for (i = 1; i < dtHeight; i++;){
		var indexString = dtStruc[# i,0];
	
		if (indexString != "-1"){
			//Find the number of words in the string
			var stringCurrent = indexString;
			var stringWidth = string_width(string(stringCurrent));
			var lineBreak = dtStruc[# i,3];
			var stringCol =	dtStruc[# i,1]; 
		
			//Check to see if the string is longer than the max width allowed on one line
			if (lineCurrent + string_width(stringCurrent) <= w && !lineBreak){
				//Draw the string if it doesn't need to break to a new line
				if (stringCol != c_black){
					draw_set_color(stringCol)
				}
			
				lineCurrent += wordSep + string_width(string(stringCurrent));
				//draw_text_ext_transformed(xx, yy, stringCurrent, lineSep, w, scale, scale, 0);
			
				draw_text_ext(xx, yy, stringCurrent, lineSep, w);
				//click region debug -> draw_rectangle(xx, yy + 2, xx + stringWidth, yy + 16, 1);
				draw_set_color(c_black);
				xx += stringWidth + wordSep;
			}else{
				//Start drawing on a new line
				yy += lineSep;	
				xx = xxOrg;
				lineCurrent = stringWidth + wordSep;
			
				if (stringCol != c_black){
					draw_set_color(stringCol)
				}
			
				draw_text_ext(xx, yy, stringCurrent, lineSep, w);	
				draw_set_color(c_black);
				xx += stringWidth + wordSep;	
			}
		}else{
			break;		
		}
	}



}
