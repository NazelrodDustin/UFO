/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


plaidTexture = spr_zombieSkinTexture;
widthTarget = 64;

moveAmount = random_range(2, 5);
moveAngle = (moveAmount / circumference) * 360;

nearestTarget = noone;
nearestTargetDistance = infinity;
wanderDirection = 0;
alarm[1] = 1;