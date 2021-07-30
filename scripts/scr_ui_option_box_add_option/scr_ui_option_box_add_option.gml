/// @func scr_option_box_add_option(optionBoxID, text, instId, option type)
/// @desc Adds option to existing optionBox
/// @param optionBox
/// @param text 
/// @param ownerId 
/// @param optionType(GLOBAL_INFO_BOX_OPTIONS)
function scr_ui_option_box_add_option() {

	var optionBox = argument[0];
	var text = argument[1];
	var instId = argument[2];
	var optionType = argument[3];

	if (instance_exists(optionBox)){
		//Find an empty slot in the option box
		for (optionPos = 0; optionPos < 500; optionPos++){
			if (optionBox.optionArray[optionPos,0] == "-1"){
				optionBox.optionArray[optionPos,0] = text; 
				optionBox.optionArray[optionPos,1] = instId; 
				optionBox.optionArray[optionPos,2] = optionType; 
				break;
			}
		}
	
		scr_ui_option_box_reize(optionBox);
	}else{
		show_debug_message("Option box does not exist");
		return -1;
	}



}
