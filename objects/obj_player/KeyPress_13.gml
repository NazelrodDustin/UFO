/// @description Insert description here
// You can write your code in this editor

if (!firstPlayer){
	var newInstance = instance_create_layer(x, y, global.layers[LAYERS.instances], obj_baricade);

	newInstance.image_angle = image_angle;
	newInstance.image_xscale = image_xscale;
}