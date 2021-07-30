/// @func scr_ui_option_box_create()
/// @desc creates a new info box
function scr_ui_option_box_create() {
	var optionBox = instance_create_layer(mouse_x, mouse_y, obj_debugCon.debugLayer, obj_uiOptionBoxGeneral);

	return optionBox;
}
