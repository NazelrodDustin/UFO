/// @func scr_ui_dt_get_last_pos_with_string(dtStruc)
/// @desc Returns the greatest index position in the dtStruc with a string
/// @param dtStruc
function scr_ui_dt_get_last_pos_with_string() {

	var dtStruc = argument[0];
	var lastPos = 0;

	if (!ds_exists(dtStruc, ds_type_grid)){
		//show_debug_message("dtStruc does not exist");
		exit;
	}

	var dtWidth = dtStruc[# 0,0];

	for (i = 1; i < dtWidth; i++){
		//find first empty
		if (dtStruc[# i, 0] != "-1"){
			lastPos = i;
		}else if (i > dtWidth){
			break;
		}
	}

	return lastPos;


}
