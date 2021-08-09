/// @description Insert description here
// You can write your code in this editor
gamePaused = false;
twoPlayer = false;
playerPlacedObjects = array_create(0);

groundSurface = noone;

connected = false;

ww = window_get_width();
hh = window_get_height();

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

global.worldControl = id;

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

alarm[0] = 60;