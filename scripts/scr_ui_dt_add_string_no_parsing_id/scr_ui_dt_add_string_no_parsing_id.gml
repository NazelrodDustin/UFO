/// @func scr_ui_dt_add_string_no_parsing_id(string, color, clickable?, newLine? dtStruc, id)
/// @desc Adds a string to an existing dynamic text struc
/// @param string 
/// @param color 
/// @param clickable? 
/// @param newLine 
/// @param dtStruc 
/// @param id
function scr_ui_dt_add_string_no_parsing_id() {

	//Check to make sure the dtStruc exists

	var str = string(argument[0]);
	var color = argument[1];
	var clickable = argument[2];
	var newLine = argument[3];
	var dtStruc = argument[4];
	var dtId = argument[4];

	if (ds_exists(dtStruc, ds_type_grid)){
		var newId = dtStruc[# 0,1];
		dtStruc[# 0,1] ++;
		var dtHeight = dtStruc[# 0,0];
	
		//Find the next index in the dtStruc and add the string
		for (loopI = 1; loopI < dtHeight; loopI++){
			if (dtStruc[# loopI,0] == "-1"){
				dtStruc[# loopI,0] = str;
				dtStruc[# loopI,1] = color; 
				dtStruc[# loopI,2] = clickable;
				dtStruc[# loopI,3] = newLine;
				dtStruc[# loopI,4] = dtId;
			
				return newId;	
			}
		}
	}else{
	
	}



}
