/// @description Insert description here
// You can write your code in this editor
alarm[0] = 6;

connected = os_is_network_connected();
show_debug_message(connected);

instance_create_layer(xx, yy, global.layers[LAYERS.instances], obj_zombie);