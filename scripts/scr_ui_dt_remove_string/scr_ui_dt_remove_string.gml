/// @func scr_ui_dt_remove_string(string, dtStruc, removeAll?)
/// @desc removes the first or all of the given strings from a dtStruc
/// @param string
/// @param dtStuc
/// @param removeAll?
function scr_ui_dt_remove_string() {

	var str = argument[0];
	var dtStruc = argument[1];
	var removeAll = argument[2];

	if (!ds_exists(dtStruc, ds_type_grid)){
		//show_debug_message("dtStruc does not exist");
		exit;
	}

	var dtWidth = dtStruc[# 0,0];

	//Loop through the dtStruc and remove the given strings/string
	for (loopI = 1; loopI < dtWidth; loopI++;){
		if (dtStruc[# loopI,0] == str){
			//remove the string because it matches
			dtStruc[# loopI,0] = "-1" 
			dtStruc[# loopI,1] = c_black; 
			dtStruc[# loopI,2] = false;
			dtStruc[# loopI,3] = false;		
			scr_ui_dt_sort(dtStruc);
			loopI = 1;
		
			// If it's not removing all the strings, exit the script
			if (!removeAll){
				break;	
			}
		}
	}



}
