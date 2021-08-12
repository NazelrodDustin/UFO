/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
var moveAmt = 0;

if (nearestTarget == noone){
	moveAmt += wanderDirection;
}else{
	if instance_exists(nearestTarget){
		var angleDifference = nearestTarget.image_angle - image_angle;
		var moveDirection = sign(angleDifference);
		if (angleDifference > 45){
			moveDirection *= -1;
		}
		moveAmt = moveDirection * moveAngle;
	}
}

if (moveAmt != 0){
	image_xscale = -1 * sign(moveAmt);
}
image_angle += moveAmt;

