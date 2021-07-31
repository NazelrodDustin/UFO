room_width = display_get_width()
room_height = display_get_height();
window_set_rectangle(0, 0, room_width, room_height);
surface_resize(application_surface, room_width, room_height);


show_debug_message(display_aa);
var aaLevel = display_aa > 2 ? (display_aa > 6 ? 8 : 4) : 2

display_reset(aaLevel, true);
//instance_create_depth(0, 0, 0, obj_debugCon);