/// @description Insert description here
// You can write your code in this editor
x = round(global.worldControl.xx);
y = round(global.worldControl.yy + (global.worldControl.hh * (3 / 4)));

radius = (global.worldControl.yy);

plaidTexture = spr_defaultTexture;
widthTarget = 32;
scale = 0;

alarm[0] = 1;

ww = global.worldControl.ww;
hh = global.worldControl.hh;

p1AngleToDraw = 0;
p2AngleToDraw = 0;

circumference = pi * 2 * radius;
inP1Cam = false;
inP2Cam = false;

