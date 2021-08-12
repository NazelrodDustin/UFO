/// @description Insert description here
// You can write your code in this editor

with (obj_player){
	var distance = abs(image_angle - other.image_angle)
	if (distance < 45 && !(other.nearestTargetDistance < distance)){
		other.nearestTarget	= id;
		other.nearestTargetDistance = distance;
	}
}


wanderDirection = irandom_range(-1, 1) * moveAngle;


alarm[1] =  irandom_range(30, 120);
