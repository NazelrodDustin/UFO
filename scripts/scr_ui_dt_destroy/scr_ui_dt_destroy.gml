/// @func scr_ui_dt_destroy(dtStruc)
/// @desc Destroys a dtStruc
/// @param dtStruc
function scr_ui_dt_destroy() {

	var dtStruc = argument[0];

	if (ds_exists(dtStruc, ds_type_grid)){
		ds_grid_destroy(dtStruc);
	}



}
