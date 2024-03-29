
if (state != "dying" && state != "dead" && state != "resurecting"){
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
	if (abs(image_angle) > 360){
		image_angle = image_angle % 360;
		if (firstPlayer){
			global.worldControl.player1Rotation -= sign(global.worldControl.player1Rotation) * 360;
		}else{
			global.worldControl.player2Rotation -= sign(global.worldControl.player2Rotation) * 360;
		}
	}
	if (moveAmt != 0){
		var screenRotation = image_angle + (firstPlayer ? global.worldControl.player1Rotation : global.worldControl.player2Rotation); 
		if ((screenRotation >= global.worldControl.moveLeftBound && moveAmt > 0) || (screenRotation <= global.worldControl.moveRightBound && moveAmt < 0)){
			global.worldControl.rotateWorld(firstPlayer, -moveAmt);
		}
	}
}

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

//if (instance_number(object_index) == 1){
//	instance_create_layer(x, y, global.layers[LAYERS.instances], object_index);
//}

if (addHealthTimer >= addHealthTime){
	myHealth += 1;
	addHealthTimer = 0;
	if (myHealth > maxHealth){
		myHealth = maxHealth;	
	}
}


event_inherited();