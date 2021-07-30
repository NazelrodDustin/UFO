/// @func scr_ui_option_box_get_option_number(optionBoxInst)
/// @desc retuns the number of options that an option box has
/// @param optionBoxInst
function scr_ui_option_box_get_option_number() {

	var optionBoxInst = argument[0];
	var arraySize = array_height_2d(optionBoxInst.optionArray);
	var optionNumber = 0;

	for (i = 0; i < arraySize; i++){
		if (optionBoxInst.optionArray[i,0] == "-1"){
			break;	
		}else{
			optionNumber++;	
		}
	}

	return optionNumber;


}
