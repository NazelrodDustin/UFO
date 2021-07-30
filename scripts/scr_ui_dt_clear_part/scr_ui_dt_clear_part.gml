/// @func scr_ui_dt_clear(dtStruc,startingIndex);
/// @desc clears part of the text from the given dtStruc starting at the inputed position
/// @param dtStruc The dtStruc to clear
/// @param startingIndex
function scr_ui_dt_clear_part() {

	var dtStruc = argument[0];
	var startingIndex = argument[1];

	if (!ds_exists(dtStruc, ds_type_grid)){
		//show_debug_message("dtStruc does not exist");
		exit;
	}

	var dtHeight = dtStruc[# 0,0];

	if (ds_exists(dtStruc, ds_type_grid)){
		for (i = startingIndex; i < dtHeight; i++){
			dtStruc[# i,0] = "-1" 
			dtStruc[# i,1] = c_black; 
			dtStruc[# i,2] = false;
			dtStruc[# i,3] = false;	
		}
	}else{
		return -1;	
	}





}
