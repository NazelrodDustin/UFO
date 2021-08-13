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

if (global.score >= 1){
	global.score--;
	scoreb++;
}

if (scoreb >= 8){
	scoreb -= 8;
	scoreB++;
	B = true;
}

if (scoreB >= 1024){
	scoreB -= 1024;
	scoreKB++;
	KB = true;
}

if (scoreKB >= 1024){
	scoreKB -= 1024;
	scoreMB++;
	MB = true;
}

if (scoreMB >= 1024){
	scoreMB -= 1024;
	scoreGB++;
	GB = true;
}

if (scoreGB >= 1024){
	scoreGB -= 1024;
	scoreTB++;
	TB = true;
}

if (scoreTB >= 1024){
	scoreTB -= 1024;
	scorePB++;
	PB = true;
}

if (scorePB >= 1024){
	scorePB -= 1024;
	scoreEB++;
	EB = true;
}

if (scoreEB >= 1024){
	scoreEB -= 1024;
	scoreZB++;
	ZB = true;
}

if (scoreZB >= 1024){
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


