var dw = display_get_width();
var dh = display_get_height();
room_width = dw;
room_height = dh;
window_set_rectangle(0, 0, dw, dh);
surface_resize(application_surface, dw, dh);

surface_depth_disable(true);

instance_create_layer(0, 0, layer_get_id("Instances"), obj_worldControl);
instance_create_layer(0, 0, layer_get_id("Instances"), obj_soundControl);
instance_create_layer(-10, 0, layer_get_id("Instances"), obj_ufo);
instance_create_layer(0, 0, layer_get_id("Instances"), obj_player);

//0A0719