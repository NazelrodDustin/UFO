/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(sprite_index, image_index, x - lengthdir_x(radius, image_angle - 90), y - lengthdir_y(radius, image_angle - 90), 1, 1, image_angle, c_white, 1);
/*var steps = 512;
var startOffset = floor(point_direction(x, y, window_get_width(), window_get_height()));
var drawAmount = 180 - (startOffset * 2);
draw_clear_alpha(c_black, 0);
draw_primitive_begin(pr_linestrip);
for(var i = 0; i <= steps; ++i){
	draw_vertex(x + lengthdir_x(radius, startOffset + (drawAmount * i / steps)), y + lengthdir_y(radius, startOffset + (drawAmount * i / steps)));
}
draw_primitive_end();
*/
image_angle += 0.00125;