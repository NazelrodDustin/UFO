/// @desc Salvage

if (!firstPlayer && instance_exists(obj_ufo)){
	var nearestUfo = instance_nearest(x, y, obj_ufo);

	if (point_distance(x, y, nearestUfo.x, nearestUfo.y) < 50){
		global.salvageParts ++;
		sound_effect_play(obj_soundControl.soundSalvage, false);
		instance_destroy(nearestUfo);
	}
}