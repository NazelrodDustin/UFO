event_inherited();

plaidTexture = spr_skinTexture;
widthTarget = 64;


firstPlayer = true;
state = "idle";
image_index = 16;

leftPressed = false;
rightPressed = false;
firstPressed = "none";

moveAmount = 5;

circumference = pi * 2 * radius;

moveAngle = (moveAmount / circumference) * 360;

myHealth = 100;
maxHealth = myHealth;
addHealthTimer = 0
addHealthTime = 100;

attackSound	= obj_soundControl.soundLaserRifle;
damageSound = obj_soundControl.soundPlayerHurt;
destroySound = obj_soundControl.soundPlayerDeath;
reviveSound = obj_soundControl.soundPlayerSpawn;

if (instance_number(object_index) > 1){
	firstPlayer = false;	
}

if (instance_number(object_index) > 2){
	instance_destroy();
	show_debug_message("Something has went wrong. There should not be more than 2 players but we just created a third");
}


function changeState(newState){
	state = newState;
	
	switch (state){
		case "moving":
			image_index = 8;
			image_speed = 1;
			break;
		
		case "idle":
			image_index = 16;
			image_speed = 1;
			break;
			
		case "dying":
			image_index = 0;
			image_speed = 1;
			sound_effect_play(destroySound, false);
			break;
		
		case "dead":
			image_index = 7;
			image_speed = 0;
			break;
			
		case "resurecting":
			image_index = 7;
			image_speed = -1;
			audio_play_sound(resurectSound, 10, false);
			break;
		
	}
}