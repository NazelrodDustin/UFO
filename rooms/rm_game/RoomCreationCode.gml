var dw = 1280;//display_get_width();
var dh = 720;//display_get_height();
room_width = dw;
room_height = dh;
window_set_rectangle(20, 20, dw, dh);
surface_resize(application_surface, dw, dh);

instance_create_layer(0, 0, layer_get_id("Instances"), obj_worldControl);
instance_create_layer(0, 0, layer_get_id("Instances"), obj_baricade);


//instance_create_depth(0, 0, 0, obj_debugCon);