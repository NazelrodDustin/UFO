/// @desc Barrier

if (!firstPlayer){
	var newInstance = instance_create_layer(x, y, global.layers[LAYERS.instances], obj_zombie);

	//newInstance.image_angle = image_angle;
	newInstance.image_xscale = image_xscale;
	
	sound_effect_play(obj_soundControl.soundBarrierPlace, false);
}