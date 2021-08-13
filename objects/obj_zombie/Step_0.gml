/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
var moveAmt = 0;
if (nearestTarget == noone){
	if (wanderDirection != 0){
		if (state != "moving"){
			changeState("moving");
		}
	}else{
		if (state != "idle"){
			changeState("idle");
		}
	}
	moveAmt += wanderDirection;
}else{
	if (instance_exists(nearestTarget)){
		nearestTargetDistance = abs(nearestTarget.p1AngleToDraw - p1AngleToDraw);
		
		var nearestTargetOffset = nearestTargetDistance + (nearestTarget.zombieAttackOffset * (nearestTarget.p1AngleToDraw > p1AngleToDraw ? -1 : 1));
		if (abs(nearestTargetOffset) < moveAngle || abs(nearestTargetDistance) < nearestTarget.zombieAttackOffset){
			if (image_index == 14){
				image_angle = nearestTarget.image_angle + (image_xscale * nearestTarget.zombieAttackOffset * .99);
			}			
			
			if (state != "attacking"){
				changeState("attacking");
			}
		}else{
			if (state != "movingToTarget"){
				changeState("movingToTarget");
			}
		}
		
		with (obj_barricade){
			if (other.nearestTarget.object_index == obj_player){
				distanceToMe1 = other.p1AngleToDraw - p1AngleToDraw + zombieAttackOffset;
				distanceToMe2 = other.p1AngleToDraw - p1AngleToDraw - zombieAttackOffset;
				distanceToMe = other.p1AngleToDraw - p1AngleToDraw;
				distanceToTarget = other.p1AngleToDraw - other.nearestTarget.p1AngleToDraw;
				
				if (sign(distanceToMe) == sign(distanceToTarget)){
					if (abs(distanceToMe) < abs(distanceToTarget)){
						other.nearestTarget	= id;
					}
				}
			}
		}
		

		if (state = "movingToTarget"){	
			var moveDirection = sign(nearestTarget.p1AngleToDraw - p1AngleToDraw);
			moveAmt = moveDirection * moveAngle;
			
			var targetDead = false;
			if (nearestTarget.object_index == obj_player){
				targetDead = nearestTarget.state == "dying" || nearestTarget.state == "dead" || nearestTarget.state == "resurecting";	
			}
		
			if (nearestTargetDistance > vision || targetDead){
				nearestTarget = noone;
				nearestTargetDistance = infinity;
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



#region Anim Control
if (state == "moving" || state == "movingToTarget"){
	if (image_index == 14){
		image_index = 8;	
	}
	
	if (image_index == 10 || image_index == 13){
		var footStep = sound_effect_play(obj_soundControl.soundFootstep, false);	
		audio_sound_gain(footStep, calcSoundDropoff() * .25, 0);
	}
}

if (state == "attacking"){
	if (image_index == 0){
		image_index = 14;
	}
	
	if (image_index == 15 && instance_exists(nearestTarget)){
		nearestTarget.takeDamage(damage);
		if (random(1) < 0.2){			
			var death = sound_effect_play(attackSound, false);	
			audio_sound_gain(death, calcSoundDropoff() * .2, 0);
		}
	}
	
	if (instance_exists(nearestTarget)){
		var targetDead = false;
		if (nearestTarget.object_index == obj_player){
			targetDead = nearestTarget.state == "dying" || nearestTarget.state == "dead" || nearestTarget.state == "resurecting";	
		}
			
		if (targetDead){
			nearestTarget = noone;
			nearestTargetDistance = infinity;
		}
	}
}

if (state == "idle"){
	if (image_index == 0){
		image_index = 16;	
	}
}

if (state == "dying"){
	if (image_index == 8){
		changeState("dead");
	}
}

if (state == "dead"){
	image_index = 7;
	image_speed = 0;
	image_alpha = image_alpha - 0.01;
	
	if (image_alpha <= 0){
		instance_destroy();	
	}
}
#endregion


