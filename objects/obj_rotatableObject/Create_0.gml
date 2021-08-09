/// @description Insert description here
// You can write your code in this editor

x = round(window_get_width() / 2);
y = round((window_get_width() * 10) + (window_get_height() * .75));

radius = (window_get_width() * 10);

plaidTexture = spr_defaultTexture;
widthTarget = 32;

scale = 1;

alarm[0] = 1;

ww = global.worldControl.ww;
hh = global.worldControl.hh;


circumference = pi * 2 * radius;