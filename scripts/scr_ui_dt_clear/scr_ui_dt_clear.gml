/// @func scr_ui_dt_clear(dtStruc);
/// @desc clears all of the text from the given dtStruc
/// @param dtStruc The dtStruc to clear
function scr_ui_dt_clear() {

	var dtStruc = argument[0];

	if (!ds_exists(dtStruc, ds_type_grid)){
		//show_debug_message("dtStruc does not exist");
		exit;
	}

	var dtHeight = dtStruc[# 0,0];

	if (ds_exists(dtStruc, ds_type_grid)){
		for (i = 1; i < dtHeight; i++){
			dtStruc[# i,0] = "-1" 
			dtStruc[# i,1] = c_black; 
			dtStruc[# i,2] = false;
			dtStruc[# i,3] = false;	
		}
	}else{
		return -1;	
	}





}
