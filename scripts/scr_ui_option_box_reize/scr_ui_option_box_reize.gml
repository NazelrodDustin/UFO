/// @func scr_ui_option_box_resize(optionBoxId)
/// @param optionBoxid
function scr_ui_option_box_reize() {
	var optionBox = argument[0]; 

	if (instance_exists(optionBox)){
		with(optionBox){
			//Find the number of options the inv slot has
			optionNumber = 0;

			for (i = 0; i <= 500; i++){
				if (optionArray[i,0] != "-1"){
					optionNumber++;
				}else{
					break;
				}
			}

			//Resize the option box size to fit the number and length of options

			//width
			var biggestWidth = optionBoxDefaultWidth * 16;

			for (i = 0; i < optionNumber; i++){
				if (string_width(optionArray[i,0]) > biggestWidth){
					biggestWidth = string_width(optionArray[i,0]);	
				}
			}

			if (biggestWidth > (optionBoxDefaultWidth * 16)){
				optionBoxWidth = ceil((biggestWidth / 16) + 0);
			}

			optionBoxHeight = ceil(optionNumber / 1.4) - 1;
 
			//Find the option click regions
			var yRegion = 8;
		
			for (i = 0; i < optionNumber; i++){
				optionArray[i,3] = yRegion;		
				optionArray[i,4] = yRegion + 12;	
				yRegion += 12;
			}
		}
	}else{
		show_debug_message("optionBox does not exist");
	}



}
