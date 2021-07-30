/// @func scr_ui_dt_get_index_from_id(dtStruc, stringId);
/// @desc returns the position in the dtStruc that a string with the inputed ID is at or -1 if the id cannot be found 
/// @param dtStruc
/// @param stringId
function scr_ui_dt_get_index_from_id() {

	var dtStruc = argument[0];
	var stringId = argument[1];

	var dtHeight = dtStruc[# 0,0];

	//Start drawing the dynamic text
	for (i = 1; i < dtHeight; i++;){
		var indexId = dtStruc[# i,4];
	
		if (indexId == stringId){
			return i;	
		}
	}

	return -1;



}
