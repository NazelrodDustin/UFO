/// @desc Radio

if (!firstPlayer){
	if (global.salvageParts > 0){
		global.salvageParts --;
		var newInstance = instance_create_layer(x, y, global.layers[LAYERS.instances], obj_radioTower);

		newInstance.image_angle = image_angle;
		newInstance.image_xscale = image_xscale;
	
		sound_effect_play(obj_soundControl.soundBarrierPlace, false);
		sound_effect_play(obj_soundControl.soundRadioPlace, false);
	}
}