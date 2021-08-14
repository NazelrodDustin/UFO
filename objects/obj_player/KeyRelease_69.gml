/// @desc Salvage

if (firstPlayer && instance_exists(obj_ufo)){
	with (obj_ufo){
		var angle = getAngle(other);
		
		if (abs(angle) < zombieAttackOffset){
			instance_destroy();
			global.salvageParts += 7;
		}
	}	
}