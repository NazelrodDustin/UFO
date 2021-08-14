/// @description Insert description here
// You can write your code in this editor

if (!firstPlayer && instance_exists(obj_radioTower)){
	with (obj_radioTower){
		var angle = getAngle(other);
		
		if (abs(angle) < zombieAttackOffset){
			if (global.salvageParts > 1){
				if (myHealth < maxHealth){
					myHealth += 200;
					global.salvageParts -= 1;
				}
			
				if (myHealth > maxHealth){
					myHealth = maxHealth;	
				}
			}else{
				global.showCantPlaceMsg = true;	
			}	
		}
	}	
}

if (!firstPlayer && instance_exists(obj_barricade)){
	with (obj_barricade){
		var angle = getAngle(other);
		
		if (abs(angle) < zombieAttackOffset){
			if (global.salvageParts > 1){
				if (myHealth < maxHealth){
					myHealth += 200;
					global.salvageParts -= 1;
				}
			
				if (myHealth > maxHealth){
					myHealth = maxHealth;	
				}
			}else{
				global.showCantPlaceMsg = true;	
			}	
		}
	}	
}