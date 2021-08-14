/// @description Insert description here
// You can write your code in this editor

var numZombies = irandom_range(5, 7)
for (var i = 0; i < numZombies; i++){
	if (instance_number(obj_zombie) < 25){
		var newInstance = instance_create_layer(x, y, global.layers[LAYERS.instances], obj_zombie);

		newInstance.image_angle = random(1) * 360;
		newInstance.image_xscale = choose(-1, 1);
	}
}	
alarm[1] = irandom_range(120, 1200);