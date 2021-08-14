/// @description Insert description here
// You can write your code in this editor
if (firstPlayer){
	if (global.salvageParts > 3){
		global.salvageParts -= 3;
		var newInstance = instance_create_layer(x, y, global.layers[LAYERS.instances], obj_barricade);

		newInstance.image_angle = image_angle;
		newInstance.image_xscale = image_xscale;
	
		sound_effect_play(obj_soundControl.soundBarrierPlace, false);
		sound_effect_play(obj_soundControl.soundRadioPlace, false);
	}else{
		global.showCantPlaceMsg = true;		
	}
}