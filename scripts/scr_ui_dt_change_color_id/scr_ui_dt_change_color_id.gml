/// @func scr_ui_dt_change_color_id(id, color, dtStruc)
/// @desc changes the color of a specific id
/// @param id 
/// @param dtStruc
function scr_ui_dt_change_color_id(checkId, color, dtStruc) {
	 if (ds_exists(dtStruc, ds_type_grid)){
		var dtWidth = dtStruc[# 0,0];
	
		for (loopI = 1; loopI < dtWidth; loopI ++){
			//Loop through dtStruc and find the first pos with the replaceId
			if (dtStruc[# loopI,4] == checkId){
				dtStruc[# i,1] = color;			
			}
		}
	}else{
		exit;	
	}


}
