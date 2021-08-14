/// @description Insert description here
// You can write your code in this editor

var newInstance = instance_create_layer(x, y, global.layers[LAYERS.instances], obj_ufo);

newInstance.image_angle = random(1) * 360;
newInstance.image_xscale = choose(-1, 1);

sound_effect_play(obj_soundControl.soundCrash, false);

alarm[2] = irandom_range(600, 1800);