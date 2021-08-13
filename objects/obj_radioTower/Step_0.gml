event_inherited();

scoreTimer++;

if (scoreTimer >= scoreTime){
	global.score++;
	scoreTimer = 0;
}