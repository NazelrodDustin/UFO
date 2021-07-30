/// @description Insert description here
// You can write your code in this editor
gamePaused = false;
twoPlayer = false;
playerPlacedObjects = array_create(0);

worldAngle = -90;
groundSurface = noone;

#region shaders
enum SHADERS{
	unmovingPlaid	
}

global.shaderUniforms = array_create(SHADERS);

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