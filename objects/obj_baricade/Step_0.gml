/// @description Insert description here
// You can write your code in this editor

//image_angle += 1;
//y += 1;
//if (image_angle >= 0){
//	image_angle = 0;	
//}


y-=10;
sprite_set_offset(sprite_index, sprite_get_width(sprite_index) / 2, sprite_get_yoffset(sprite_index) - 10);

show_debug_message(y)