/// @description Insert description here
// You can write your code in this editor

var secondOffset = (firstPlayer ? 0 : global.worldControl.hh / 2);

draw_text(10, secondOffset + 10, string(image_angle));
draw_text(10, secondOffset + 50, string(p1AngleToDraw));
draw_text(10, secondOffset + 90, string(global.worldControl.player1Rotation));
draw_text(10, secondOffset + 130, string(p2AngleToDraw));
draw_text(10, secondOffset + 170, string(global.worldControl.player2Rotation));
draw_text(10, secondOffset + 210, string(global.worldControl.moveLeftBound));
draw_text(10, secondOffset + 250, string(global.worldControl.moveRightBound));
