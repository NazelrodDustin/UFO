/// @description Insert description here
// You can write your code in this editor
x = round(global.worldControl.xx);
y = round(global.worldControl.yy + (global.worldControl.hh * (3 / 4)));

radius = (global.worldControl.yy);

plaidTexture = spr_defaultTexture;
widthTarget = 32;
scale = 0;
myHealth = infinity;

alarm[0] = 1;

ww = global.worldControl.ww;
hh = global.worldControl.hh;

p1AngleToDraw = 0;
p2AngleToDraw = 0;

circumference = pi * 2 * radius;

zombieAttackOffset = 0;
damageSound = noone;
destroySound = noone;

function takeDamage(damage){
	myHealth -= damage;
	if (myHealth <= 0){
		if (object_index != obj_player && object_index != obj_zombie){
			instance_destroy();
		}else{
			if (state != "dying" && state != "dead"){
				changeState("dying");	
			}
		}
	}
	
	if (object_index != obj_player && object_index != obj_zombie){
		sound_effect_play(myHealth < 0 ? destroySound : damageSound, false);
	}else{
		if (object_index == obj_player){
			addHealthTimer = -1000;	
		}
		if (myHealth > 0){
			sound_effect_play(damageSound, false);
		}
	}
}

function getAngle(object){
	var a1 = abs(p1AngleToDraw - object.p1AngleToDraw);
	var a2 = abs((p1AngleToDraw + 360) - object.p1AngleToDraw);
	var a3 = abs(p1AngleToDraw - (object.p1AngleToDraw + 360));
	
	return min(a1, a2, a3);
}