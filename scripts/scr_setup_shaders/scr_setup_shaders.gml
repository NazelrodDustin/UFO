// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setup_plaid_texture(sprite, subImage){
	texture_set_stage(global.shaderUniforms[SHADERS.unmovingPlaid][UNMOVINGPLAID.plaidTex], sprite_get_texture(sprite, subImage));
	shader_set_uniform_f(global.shaderUniforms[SHADERS.unmovingPlaid][UNMOVINGPLAID.texWidth], sprite_get_width(sprite));
	shader_set_uniform_f(global.shaderUniforms[SHADERS.unmovingPlaid][UNMOVINGPLAID.texHeight], sprite_get_height(sprite));
}