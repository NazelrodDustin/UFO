/// @description Insert description here
// You can write your code in this editor


var moveAmt = 0;
if (leftPressed){
	if (firstPressed == "none"){
		firstPressed = "left";
	}
	
	if (firstPressed == "right"){
		if (!rightPressed){
			firstPressed = "none";	
		}
		
		moveAmt = 0;
		if (state != "idle"){
			changeState("idle");
		}
	}else if (firstPressed == "left"){
		if (!rightPressed){
			moveAmt = moveAngle;
			if (state != "moving"){
				changeState("moving");
			}
			image_xscale = -1;
		}
	}
}

if (rightPressed){
	if (firstPressed == "none"){
		firstPressed = "right";
	}
	
	if (firstPressed == "left"){
		if (!leftPressed){
			firstPressed = "none";	
		}
		
		moveAmt = 0;
		if (state != "idle"){
			changeState("idle");
		}
	}else if (firstPressed == "right"){
		if (!leftPressed){
			moveAmt = -moveAngle;
			if (state != "moving"){
				changeState("moving");
			}
			image_xscale = 1;
		}
	}
}

if (!leftPressed && !rightPressed){
	if (state != "idle"){
		changeState("idle");
	}
	firstPressed = "none";
}

image_angle += moveAmt;


#region Anim Control
if (state == "moving"){
	if (image_index == 14){
		image_index = 8;	
	}
}

if (state == "idle"){
	if (image_index == 0){
		image_index = 16;	
	}
}

if (state == "dying"){
	if (image_index == 8){
		changeState("dead");
	}
}

if (state == "dead"){
	image_index = 7;
	image_speed = 0;
}

if (state == "resurecting"){
	if (image_index = 0){
		changeState("idle");
	}
}
#endregion