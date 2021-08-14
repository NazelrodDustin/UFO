randomize();

global.score = 0;
global.salvageParts = 0;

global.worldControl = id;

ww = window_get_width();
hh = window_get_height();
xx = ww / 2;
yy = (ww * 2);

gamePaused = false;
twoPlayer = false;

player1Rotation = 0;
player2Rotation = 0;

moveLeftBound = point_direction(xx, yy, ww / 4, hh / 2) - 90;
moveRightBound = point_direction(xx, yy, ww * (3 / 4), hh / 2) - 90;

groundSurface = noone;

connected = false;

#region //Layers
enum LAYERS{
	instances
}

global.layers[LAYERS.instances] = layer_get_id("Instances");
#endregion

#region //Shaders
enum SHADERS{
	unmovingPlaid	
}

global.shaderUniforms = array_create(0);

#region Unmoving Plaid
enum UNMOVINGPLAID{
	plaidTex,
	texWidth,
	texHeight
}
global.shaderUniforms[SHADERS.unmovingPlaid] = [shader_get_sampler_index(shd_unmovingPlaid, "u_uPlaidTex"),
												shader_get_uniform(shd_unmovingPlaid, "u_uTexWidth"),
												shader_get_uniform(shd_unmovingPlaid, "u_uTexHeight")];
#endregion
#endregion

#region //Camera Setups
view_enabled = true;

view_visible[0] = true;
view_visible[1] = false;

view_camera[0] = camera_create_view((-ww * 2) - (ww / 2), 0, ww, hh);
view_camera[1] = camera_create_view((ww * 2) - (ww / 2), hh / 2, ww, hh / 2);

view_xport[0] = 0;
view_xport[1] = 0;

view_yport[0] = 0;
view_yport[1] = hh / 2;

view_wport[0] = ww;
view_wport[1] = ww;

view_hport[0] = hh;
view_hport[1] = hh / 2;
#endregion

#region //functions

function rotateWorld(playerOne, amount){
	if (playerOne){
		player1Rotation += amount;
		player1Rotation = player1Rotation % 360;
	}else{
		player2Rotation += amount;
		player2Rotation = player2Rotation % 360;
	}
}

#endregion

#region Ship Spawning

shipSpawnTimer = 0;
shipSpawnTime = 100;

#endregion

#region Stars

starSurface = -1;
starSurfaceUpdate = true;
numberOfStars = 5000;
starFieldWidth = ww * 5;
starFieldHeight = ww * 5;
starAlpha = 1;
starAngle = 0;
starAngleP2 = 0;
starSprite = -1;

star = function(_x, _y) constructor{
	x = _x;
	y = _y;
	col = choose(c_white);
}

starPosArray = [];

for (var i = 0; i < numberOfStars; i++){
	starPosArray[i] = new star(irandom(starFieldWidth), irandom(starFieldHeight));	
}

#endregion

instance_create_layer(x, y, global.layers[LAYERS.instances], obj_drawControl);

alarm[0] = 60;


time = current_time;

B = false;
KB = false;
MB = false;
GB = false;
TB = false;
PB = false;
EB = false;
ZB = false;
YB = false;

scoreb = 0;
scoreB = 0;
scoreKB = 0;
scoreMB = 0;
scoreGB = 0;
scoreTB = 0;
scorePB = 0;
scoreEB = 0;
scoreZB = 0;
scoreYB = 0;

function getBiggestSize(){
	var returnVal = "b";
	returnVal = B ? "B" : returnVal;
	returnVal = KB ? "KB" : returnVal;
	returnVal = MB ? "MB" : returnVal;
	returnVal = GB ? "GB" : returnVal;
	returnVal = TB ? "TB" : returnVal;
	returnVal = PB ? "PB" : returnVal;
	returnVal = EB ? "EB" : returnVal;
	returnVal = ZB ? "ZB" : returnVal;
	returnVal = YB ? "YB" : returnVal;
	return returnVal;
}

function getBiggestSizeValue(){
	return variable_instance_get(self, "score" + getBiggestSize());
}

function getSecondBiggestSizeValue(){
	var returnVal = "b";
	returnVal = KB ? "B" : returnVal;
	returnVal = MB ? "KB" : returnVal;
	returnVal = GB ? "MB" : returnVal;
	returnVal = TB ? "GB" : returnVal;
	returnVal = PB ? "TB" : returnVal;
	returnVal = EB ? "PB" : returnVal;
	returnVal = ZB ? "EB" : returnVal;
	returnVal = YB ? "ZB" : returnVal;
	return variable_instance_get(self, "score" + returnVal);
}

alarm[1] = 600;
alarm[2] = 1200;