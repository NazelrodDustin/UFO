/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
var moveAmt = 0;

show_debug_message("Hit Step 9");
if (nearestTarget == noone){
	moveAmt += wanderDirection;
}else{
	if (instance_exists(nearestTarget)){
		nearestTargetDistance = abs(nearestTarget.p1AngleToDraw - p1AngleToDraw);
		var moveDirection = sign(nearestTarget.p1AngleToDraw - p1AngleToDraw);
		moveAmt = moveDirection * moveAngle;
		
		if (nearestTargetDistance > 25){
			nearestTarget = noone;
			nearestTargetDistance = infinity;
		}
		
		with (obj_barricade){
			if (object_get_name(other.nearestTarget) == obj_player){
				distanceToMe = other.p1AngleToDraw - p1AngleToDraw;
				distanceToTarget = other.p1AngleToDraw - other.nearestTarget.p1AngleToDraw;
				
				if (sign(distanceToMe) == sign(distanceToTarget)){
					if (abs(distanceToMe) < abs(distanceToTarget)){
						other.nearestTarget	= id;
					}
				}
			}
		}
		
	}else{
		alarm[1] = 1;
		nearestTarget = noone;
		nearestTargetDistance = infinity;
	}
}

if (moveAmt != 0){
	image_xscale = -1 * sign(moveAmt);
}
image_angle += moveAmt;

