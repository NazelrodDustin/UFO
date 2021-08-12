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
view_visible[1] = true;

view_camera[0] = camera_create_view((-ww * 2) - (ww / 2), hh / 2, ww, hh / 2);
view_camera[1] = camera_create_view((ww * 2) - (ww / 2), hh / 2, ww, hh / 2);

view_xport[0] = 0;
view_xport[1] = 0;

view_yport[0] = 0;
view_yport[1] = hh / 2;

view_wport[0] = ww;
view_wport[1] = ww;

view_hport[0] = hh / 2;
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

instance_create_layer(x, y, global.layers[LAYERS.instances], obj_drawControl);

alarm[0] = 60;


time = current_time;