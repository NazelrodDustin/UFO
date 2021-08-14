event_inherited();

scoreTimer++;

if (scoreTimer >= scoreTime){
	global.score += 8 * power(instance_number(object_index), 2);
	scoreTimer = 0;
}