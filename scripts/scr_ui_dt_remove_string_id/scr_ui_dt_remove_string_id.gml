/// @func scr_ui_dt_remove_string_id(string, dtStruc, removeAll?, id)
/// @desc removes all of the given strings from a dtStruc with the given id
/// @param dtStuc
/// @param id
function scr_ui_dt_remove_string_id() {

	var dtStruc = argument[0];
	var removeId = argument[1];

	if (!ds_exists(dtStruc, ds_type_grid)){
		//show_debug_message("dtStruc does not exist");
		exit;
	}

	var dtWidth = dtStruc[# 0,0];

	//Loop through the dtStruc and remove the given strings/string
	for (loopI = 1; loopI < dtWidth; loopI++;){
		if (dtStruc[# loopI,4] == removeId){
			//remove the string because it matches
			dtStruc[# loopI,0] = "-1" 
			dtStruc[# loopI,1] = c_black; 
			dtStruc[# loopI,2] = false;
			dtStruc[# loopI,3] = false;		
			dtStruc[# loopI,4] = -1;	
		}
	}

	scr_ui_dt_sort(dtStruc);



}
