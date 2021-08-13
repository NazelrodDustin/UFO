//show_debug_message("Frame length:" + string(current_time - time));

//time = current_time;

//Ship spawning
shipSpawnTimer ++;

if (shipSpawnTimer >= shipSpawnTime){
	shipSpawnTimer = 0;
	
	var ship = instance_create_layer(0, 0, layer_get_id("Instances"), obj_ufo);
	ship.image_angle = irandom(360);
}