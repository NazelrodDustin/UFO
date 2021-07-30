/// @func scr_ui_dt_get_full_string(dtStruc)
/// @desc returns the entire string of dtStruc
/// @param dtStruc
function scr_ui_dt_get_full_string() {

	var dtStruc = argument[0];
	var str = "";

	if (!ds_exists(dtStruc, ds_type_grid)){
		//show_debug_message("dtStruc does not exist");
		exit;
	}

	//Make sure that the dtStruc is sorted first
	scr_ui_dt_sort(dtStruc);

	var dtWidth = dtStruc[# 0,0];

	//loop through the dtStruc and combine all the indexes into one string
	for (i = 1; i < dtWidth; i++;){
		if (dtStruc[# i,0] != "-1"){
			str += dtStruc[# i,0] + " ";
		}else{
			break;		
		}
	}

	show_message(str);
	return str;



}
