/// @func sound_effect_add_variation(arrayId, soundIndex)
/// @desc Adds a round robin (variation of sample) to the given sound effect array
/// @param arrayId
/// @param soundIndex 
function sound_effect_add_variation(arrayId, soundIndex) {
	if (!is_array(arrayId) || !audio_exists(soundIndex)){
		show_debug_message("Failed to add sound effect variation, array or soundIndex doesn't exist.");
		exit;
	}

	var arraySize = array_length(arrayId);

	for (i = 8; i < arraySize; i++){
		if (arrayId[i] == -1){
			arrayId[@ i] = soundIndex;
			break;
		}
	}
}

/// @func sound_effect_create_varied_sample(falloff_ref, falloff_max, falloff_factor, baseName, gain, pitchRandom, volRandom, priority)
/// @Creates an array to hold a sound effect's round robins and sets up the falloff settings
/// @param falloff_ref
/// The distance in which the sound starts falling off 
/// @param falloff_max
/// The max distance that the sound can be heard from the listener position        
/// @param falloff_factor 
/// The number(1 by default) that the falloff model uses to calculation the falloff curve of the sound effect
/// @param baseName
/// The string name for the sound resource minus the number for parsing and adding all the variations
/// @param gain
/// The gain (volume) of the samples
/// @param pitchRandom
/// To what degree the pitch of the samples vary
/// @param volRandom
/// To what degree the volume of the samples vary
/// @param priority
function sound_effect_create_varied_sample(falloffRef, falloffMax, falloffFactor, baseName, gain, pitchRandom, volRandom, priority) {
	var newEffectArray = array_create(20, -1);

	newEffectArray[@ 0] = 0; //Round robin position
	newEffectArray[@ 1] = gain; //Gain of the samples
	newEffectArray[@ 2] = pitchRandom;
	newEffectArray[@ 3] = volRandom;
	newEffectArray[@ 4] = priority;
	newEffectArray[@ 5] = falloffRef;
	newEffectArray[@ 6] = falloffMax;
	newEffectArray[@ 7] = falloffFactor;

	//Parse through the sound names and add existing samples
	var maxSampleCheck = 50; //I don't think there will ever be a sound with more than 50 variations??

	for (a = 0; a < maxSampleCheck; a++){
		var soundIndex = asset_get_index(baseName + string(a + 1));
	
		if (soundIndex != -1){
			sound_effect_add_variation(newEffectArray, soundIndex);	
		}else{
			break;	
		}
	}

	return newEffectArray;
}

/// @func sound_effect_get_rr_number(arrayId)
/// @desc Returns the number of rrs (variations) that a sound effect has 
/// @param arrayId
function sound_effect_get_rr_number(arrayId) {
	if (!is_array(arrayId)){
		show_debug_message("Failed to add sound effect variation, array doesn't exist.");
		exit;
	}

	var rrNumber = 0;
	var arraySize = array_length(arrayId);

	for (i = 8; i < arraySize; i++){
		if (arrayId[i] != -1){
			rrNumber ++;	
		}else{
			break;	
		}
	}

	return rrNumber;
}


/// @func sound_effect_play_varied_sample(arrayId, x, y, loop)
/// @desc Plays a variation of a sound effect within a given sound effect array and returns the id of the sound
/// @param arrayId
/// @param x 
/// @param y 
/// @param loop 

function sound_effect_play_varied_sample(arrayId, xx, yy, loop) {
	if (!is_array(arrayId)){
		show_debug_message("Failed to play sound effect variation, array doesn't exist.");
		exit;
	}

	var falloffRef = arrayId[5];
	var falloffMax = arrayId[6];
	var falloffFactor = arrayId[7];
	var pitchRandom = arrayId[2];
	var pitchRandomAdd = random_range(-(pitchRandom), pitchRandom);
	var gainBase = arrayId[1];
	var volRandom = arrayId[3];
	var volRandomized = random_range(gainBase - volRandom, gainBase);
	var rrPosition = arrayId[0];
	var soundToPlay = arrayId[8 + rrPosition];
	var priority = arrayId[4];

	//Attempt to find a variation of the sound that is not playing
	var rrNumber = sound_effect_get_rr_number(arrayId);

	for (i = 8; i < 8 + rrNumber; i++){
		if (!audio_is_playing(arrayId[i])){
			soundToPlay = arrayId[i];
			break;
		}
	}

	//Play the sound 
	var soundEffect = audio_play_sound_at(soundToPlay, xx, yy, 0, falloffRef, falloffMax, falloffFactor, loop, priority); 
	audio_sound_gain(soundEffect, volRandomized, 0);
	audio_sound_pitch(soundEffect, 1 + pitchRandomAdd);
	//Randomize RR position
	var oldRR = rrPosition;
	var newRR = oldRR;

	while (oldRR == newRR){
		newRR = irandom(rrNumber - 1);	
	}

	arrayId[@ 0] = newRR;

	return soundEffect;
}

/// @func sound_effect_play_varied_sample_centered(arrayId, loop)
/// @desc Plays a variation of a sound effect within a given sound effect array at the center position of the center
/// @param arrayId
/// @param loop 

function sound_effect_play_varied_sample_centered(arrayId, loop) {
	if (!is_array(arrayId)){
		show_debug_message("Failed to play sound effect variation, array doesn't exist.");
		exit;
	}

	var xx = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2);
	var yy = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2);

	sound_effect_play_varied_sample(arrayId, xx, yy, loop);
}


/// @func sound_effect_set_falloff_settings(arrayId, falloff_ref, falloff_max, falloff_factor)
/// @desc Sets falloff settings of a given sound effect 
/// @param arrayId
/// @param falloff_ref
/// @param falloff_max
/// @param falloff_factor

function sound_effect_set_falloff_settings(arrayId, falloffRef, falloffMax, falloffFactor) {
	if (!is_array(arrayId)){
		show_debug_message("Failed to set sound effect falloff, array doesn't exist.");
		exit;
	}

	arrayId[@ 5] = falloffRef;
	arrayId[@ 6] = falloffMax;
	arrayId[@ 7] = falloffFactor;
}


