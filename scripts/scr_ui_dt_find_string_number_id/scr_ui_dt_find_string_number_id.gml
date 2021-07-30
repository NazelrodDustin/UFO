/// @func scr_ui_dt_find_string_number_id(id, dtStruc)
/// @desc Find the number strings that a given id has in a dtStruc
/// @param id 
/// @param dtStruc
function scr_ui_dt_find_string_number_id() {

	var checkId = argument[0];
	var dtStruc = argument[1]; 
	var stringNum = 0;

	 if (ds_exists(dtStruc, ds_type_grid)){
		var dtWidth = dtStruc[# 0,0];
	 
		for (loopI = 1; loopI < dtWidth; loopI ++){
			//Loop through dtStruc and find the first pos with the replaceId
			if (dtStruc[# loopI,4] == checkId){
				stringNum ++;
			}
		}
	
		//Return the total number of string that the id has
		return stringNum;
	}else{
		exit;	
	}


}
