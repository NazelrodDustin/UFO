/// @func scr_ui_dt_get_id_at_point(x, y, xAdd, yAdd, xMinus, yMinus, dtStruc, lineSep, wordSep, w, checkX, checkY)
/// @desc Returns the id of a string that mouse the is over from a dtStruc or -1 if the moouse isn't over any ids
/// @param xx 
/// @param yy
/// @param xAdd
/// @param yAdd
/// @param xMinus
/// @param yMinus
/// @param dtStruc
/// @param lineSep
/// @param wordSep
/// @param w
/// @param checkX
/// @param checkY
function scr_ui_dt_get_id_at_point() {

	var xx = argument[0];
	var yy = argument[1];
	var xAdd = argument[2];
	var yAdd = argument[3];
	var xMinus = argument[4];
	var yMinus = argument[5];
	var dtStruc = argument[6];
	var lineSep = argument[7];
	var	wordSep = argument[8]; 
	var w = argument[9];
	var checkX = argument[10];
	var checkY = argument[11];
	var lineCurrent = 0;
	var xxOrg = xx;

	var dtWidth = dtStruc[# 0,0];

	for (i = 1; i < dtWidth; i++;){
		var indexString = dtStruc[# i,0];
		var indexId = dtStruc[# i,4];
	
		if (indexString != "-1"){
			//Init some useful vars
			var stringCurrent = indexString;
			var stringWidth = string_width(stringCurrent);
			var lineBreak = dtStruc[# i,3];
			var stringHeight = string_height(stringCurrent);
			//Check to see if the string is longer than the max width allowed on one line
		
			if (lineCurrent + string_width(stringCurrent) <= w && !lineBreak){
				lineCurrent += wordSep + string_width(stringCurrent);
				//Check too see if the mouse is in the click region for this string
				var inRegion = point_in_rectangle(checkX, checkY, xx, yy + 2, xx + stringWidth + wordSep, yy + 16);
			
				if (inRegion){
					return indexId;
				}

				xx += stringWidth + wordSep;
			}else{
				yy += lineSep;	
				xx = xxOrg;
				lineCurrent = stringWidth + wordSep;
				//Check too see if it's the string your trying to check and return whether or not the mouse is in the click region
				var inRegion = point_in_rectangle(checkX, checkY, xx - xMinus, yy + 1 - yMinus, xx + stringWidth + wordSep + xAdd, yy + stringHeight + yAdd);
			
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
