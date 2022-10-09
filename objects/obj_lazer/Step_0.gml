/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


image_angle += moveAngle * -image_xscale;

moveAmount -= power(timeAlive, 2) / 1000;

circumference = pi * 2 * radius;

moveAngle = (moveAmount / circumference) * 360;

show_debug_message(moveAmount);

with (obj_zombie){
	if (state != "dying" && state != "dead"){
		angle = getAngle(other);
	
		if (abs(angle) < other.moveAngle){
			other.hit = id;	
		}
	}
}

if (instance_exists(hit)){
	hit.takeDamage(moveAmount);
	hit = noone;
	instance_destroy();	
}

if (moveAmount <= 0){
	instance_destroy();	
}

image_alpha = power(moveAmount / 15, 1.1);

timeAlive++;