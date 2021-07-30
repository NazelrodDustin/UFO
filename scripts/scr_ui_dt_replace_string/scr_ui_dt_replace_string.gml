/// @func scr_ui_dt_replace_string(string, newString, color, clickable?, newline?, replaceAll? dtStruc)
/// @desc replaces all or the first of a given string within a dtStruc
/// @param string 
/// @param newString 
/// @param color 
/// @param clickable? 
/// @param newLine?
/// @param replaceAll? 
/// @param dtStruc
function scr_ui_dt_replace_string() {

	var str = argument[0];
	var strNew = argument[1];
	var color = argument[2];
	var clickable = argument[3];
	var newLine = argument[4];
	var replaceAll = argument[5];
	var dtStruc = argument[6];

	//Loop through the dtStruc and replace the string/strings with the given new string
	if (ds_exists(dtStruc, ds_type_grid)){
		var dtHeight = ds_grid_width(dtStruc);
	
		for (i = 1; i < dtHeight; i++){
			var indexString = dtStruc[# i,0];
		
			if (indexString == str){
				dtStruc[# i,0] = strNew;
				dtStruc[# i,1] = color; 
				dtStruc[# i,2] = clickable;
				dtStruc[# i,3] = newLine;	
			
				if (!replaceAll){
					break;	
				}
			}
			//If the script is only replacing the first string in the dtStruc, then exit the string
		
			//If there are no more strings to check in the dtStruc, exit the script
			if (indexString == "-1"){
				exit;	
			}
		}
	}else{
		exit;	
	}



}
