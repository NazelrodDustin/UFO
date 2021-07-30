/// @func scr_ui_dt_draw_debug(dtStruc)
/// @param dtStruc
/// @desc draws the contents of a  dtStruc
function scr_ui_dt_draw_debug() {

	var dtStruc = argument[0];

	var yy = 0;

	if (!ds_exists(dtStruc, ds_type_grid)){
		//show_debug_message("dtStruc does not exist");
		exit;
	}

	var dtWidth = dtStruc[# 0,0];

	for (i = 1; i < dtWidth; i++){
		draw_text(mouse_x, mouse_y + yy, dtStruc[# i,0]);
		yy += 8;
	}


}
