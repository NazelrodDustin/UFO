/// @description Insert description here
// You can write your code in this editor
show_debug_message("Hit Before");
x = round(window_get_width() / 2);
y = round((window_get_width() * 10) + (window_get_height() * .75));

radius = (window_get_width() * 10);

plaidTexture = spr_defaultTexture;
widthTarget = 32;
scale = 0;

alarm[0] = 1;

ww = global.worldControl.ww;
hh = global.worldControl.hh;

p1AngleToDraw = 0;
p2AngleToDraw = 0;

circumference = pi * 2 * radius;
show_debug_message("Hit After");