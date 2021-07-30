/// @description Init stuff

//Option box
optionBoxWidth = 3;
optionBoxHeight = 3;
optionBoxDefaultWidth = 1;
optionBoxX = 0;
optionBoxY = 0;
optionNumber = 0;
optionActivate = -1;
showOptionBox = 0;
selectingWithArrows = false;
selectingWithArrowsPosition = 0;

//Create the array to store the option info
for (i = 0; i < 500; i++){
	optionArray[i,0] = "-1"; //text 
	optionArray[i,1] = noone; //instance id of the object the option is for
	optionArray[i,2] = GLOBAL_INFO_BOX_OPTION_TYPES.none; //the option type
	optionArray[i,3] = 0; // click region y start
	optionArray[i,4] = 0; //click region y end
}

scr_ui_option_box_reize(id);
