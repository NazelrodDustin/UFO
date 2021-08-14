/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


plaidTexture = spr_zombieSkinTexture;
widthTarget = 64;

vision = 5;
soundDropOff = 25;
moveAmount = random_range(2, 5);
moveAngle = (moveAmount / circumference) * 360;
realMoveAmount = 0;
nearestTarget = noone;
nearestTargetDistance = infinity;
wanderDirection = 0;

myHealth = irandom_range(50, 100);
maxHealth = myHealth;

attackSound	= obj_soundControl.soundZombieDying;
damageSound = obj_soundControl.soundZombieDying;
destroySound = obj_soundControl.soundZombieGeneral;

damage = irandom_range(5, 15);

alarm[1] = 1;

state = "idle";


function changeState(newState){
	state = newState;
	
	switch (state){
		case "moving":
		case "movingToTarget":
			image_index = 8;
			image_speed = 1;
			break;
		
		case "attacking":
			image_index = 20;
			image_speed = 1;
			break
		
		case "idle":
			image_index = 16;
			image_speed = 1;
			break;
			
		case "dying":
			var death = sound_effect_play(destroySound, false);	
			audio_sound_gain(death, calcSoundDropoff() * 6, 0);
			image_index = 0;
			image_speed = 1;
			break;
		
		case "dead":
			image_index = 7;
			image_speed = 0;
			break;
	}
}

function calcSoundDropoff(){
	var playerDistance = abs(p1AngleToDraw - instance_find(obj_player, 0).p1AngleToDraw);
		
	if (global.worldControl.twoPlayer){
		var pd2 = abs(p1AngleToDraw - instance_find(obj_player, 1).p1AngleToDraw);
		playerDistance = pd2 < playerDistance ? pd2 : playerDistance;	
	}
		
	var distance = (soundDropOff - playerDistance);
	distance = distance < 0 ? 0 : distance;
	var gain = distance / soundDropOff;
	
	return gain;
}

