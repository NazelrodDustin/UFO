/// @description Insert description here
// You can write your code in this editor

with (obj_barricade){
	
	var d1 = image_angle - other.image_angle;
	var d2 = (image_angle + 360) - other.image_angle;
	var d3 = image_angle - (other.image_angle + 360);
	
	var distance = min(abs(d1), abs(d2), abs(d3));
	if (distance < 25 && !(other.nearestTargetDistance < distance)){
		other.nearestTarget	= id;
		other.nearestTargetDistance = distance;
	}
}

with (obj_radioTower){
	var d1 = image_angle - other.image_angle;
	var d2 = (image_angle + 360) - other.image_angle;
	var d3 = image_angle - (other.image_angle + 360);
	
	var distance = min(abs(d1), abs(d2), abs(d3));
	if (distance < 25 && !(other.nearestTargetDistance < distance)){
		other.nearestTarget	= id;
		other.nearestTargetDistance = distance;
	}
}

with (obj_ufo){
	var d1 = image_angle - other.image_angle;
	var d2 = image_angle < 25 ? (image_angle + 360) - other.image_angle : image_angle - other.image_angle;
	var d3 = image_angle > 335 ? image_angle - (other.image_angle + 360) : image_angle - other.image_angle;
	
	var distance = min(abs(d1), abs(d2), abs(d3));
	if (distance < 25 && !(other.nearestTargetDistance < distance)){
		other.nearestTarget	= id;
		other.nearestTargetDistance = distance;
	}
}

with (obj_player){
	var d1 = image_angle - other.image_angle;
	var d2 = (image_angle + 360) - other.image_angle;
	var d3 = image_angle - (other.image_angle + 360);
	
	var distance = min(abs(d1), abs(d2), abs(d3));
	if (distance < 25 && (!(other.nearestTargetDistance < distance))){
		other.nearestTarget	= id;
		other.nearestTargetDistance = distance;
	}
}

wanderDirection = irandom_range(-1, 1) * moveAngle;


alarm[1] =  irandom_range(30, 120);
