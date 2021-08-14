//show_debug_message("Frame length:" + string(current_time - time));

//time = current_time;

//Ship spawning
/*shipSpawnTimer ++;

if (shipSpawnTimer >= shipSpawnTime){
	shipSpawnTimer = 0;
	
	var ship = instance_create_layer(0, 0, layer_get_id("Instances"), obj_ufo);
	ship.image_angle = irandom(360);
}

*/

while (global.score >= 1){
	global.score--;
	scoreb++;
}

while (scoreb >= 8){
	scoreb -= 8;
	scoreB++;
	B = true;
}

while (scoreB >= 1024){
	scoreB -= 1024;
	scoreKB++;
	KB = true;
}

while (scoreKB >= 1024){
	scoreKB -= 1024;
	scoreMB++;
	MB = true;
}

while (scoreMB >= 1024){
	scoreMB -= 1024;
	scoreGB++;
	GB = true;
}

while (scoreGB >= 1024){
	scoreGB -= 1024;
	scoreTB++;
	TB = true;
}

while (scoreTB >= 1024){
	scoreTB -= 1024;
	scorePB++;
	PB = true;
}

while (scorePB >= 1024){
	scorePB -= 1024;
	scoreEB++;
	EB = true;
}

while (scoreEB >= 1024){
	scoreEB -= 1024;
	scoreZB++;
	ZB = true;
}

while (scoreZB >= 1024){
	scoreZB -= 1024;
	scoreYB++;
	YB = true;
}

var decimal = (B ? string(getSecondBiggestSizeValue() == 0 ? "" : getSecondBiggestSizeValue() / (KB ? 1024 : 8)) : "");

if (decimal != ""){
	var temp = "."
	var decHit = false;
	for (var i = 0; i < string_length(decimal); i++){
		if (decHit){
			temp += string_char_at(decimal, i + 1);	
		}else{
			decHit = (string_char_at(decimal, i + 1) == ".");	
		}
	}
	
	decimal = temp;
}

global.scoreData = "Data Uploaded: " + string(getBiggestSizeValue()) + decimal + getBiggestSize()


