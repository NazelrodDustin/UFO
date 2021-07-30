/// @func scr_ui_dt_find_string_number(dtStruc)
/// @desc finds the number of words in a dtStruc
/// @param dtStruc
function scr_ui_dt_find_string_number() {

	var dtStruc = argument[0];
	var stringNumber = 0;

	if (!ds_exists(dtStruc, ds_type_grid)){
		//show_debug_message("dtStruc does not exist");
		exit;
	}

	var dtWidth = dtStruc[# 0,0];

	for (i = 1; i < dtWidth; i++){
		//find first empty
		if (dtStruc[# i, 0] != "-1"){
			stringNumber++;
		}else if (i > ds_grid_width(dtStruc)){
			break;
		}
	}

	return stringNumber;




}
