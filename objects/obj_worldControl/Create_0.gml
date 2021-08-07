/// @description Insert description here
// You can write your code in this editor
gamePaused = false;
twoPlayer = false;
playerPlacedObjects = array_create(0);

worldAngle1 = -90;
worldAngle2 = -90;
grassSurface = noone;
groundSurface = noone;

connected = false;


#region shaders
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
show_debug_message(global.shaderUniforms);

alarm[0] = 60;