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

	for (i = 5; i < arraySize; i++){
		if (arrayId[i] == -1){
			arrayId[@ i] = soundIndex;
			break;
		}
	}
}

/// @func sound_effect_create(baseName, gain, pitchRandom, volRandom, priority)
/// @Creates an array to hold a sound effect's round robins 
/// @param baseName
/// The string name for the sound resource minus the number for parsing and adding all the variations
/// @param gain
/// The gain (volume) of the samples
/// @param pitchRandom
/// To what degree the pitch of the samples vary
/// @param volRandom
/// To what degree the volume of the samples vary
/// @param priority
function sound_effect_create(baseName, gain, pitchRandom, volRandom, priority) {
	var newEffectArray = array_create(20, -1);

	newEffectArray[@ 0] = 0; //Round robin position
	newEffectArray[@ 1] = gain; //Gain of the samples
	newEffectArray[@ 2] = pitchRandom;
	newEffectArray[@ 3] = volRandom;
	newEffectArray[@ 4] = priority;

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

	for (i = 5; i < arraySize; i++){
		if (arrayId[i] != -1){
			rrNumber ++;	
		}else{
			break;	
		}
	}

	return rrNumber;
}


/// @func sound_effect_play(arrayId, loop)
/// @desc Plays a variation of a sound effect within a given sound effect array and returns the id of the sound
/// @param arrayId
/// @param loop 

function sound_effect_play(arrayId, loop){
	if (!is_array(arrayId)){
		show_debug_message("Failed to play sound effect variation, array doesn't exist.");
		exit;
	}

	var rrPosition = arrayId[0];
	//show_message("RR Pos: " + string(rrPosition));
	var soundToPlay = arrayId[5 + rrPosition];
	//show_message("Sound: " + string(soundToPlay));
	var gainBase = arrayId[1];
	var pitchRandom = arrayId[2];
	var pitchRandomAdd = random_range(-(pitchRandom), pitchRandom);
	var volRandom = arrayId[3];
	var volRandomized = random_range(gainBase - volRandom, gainBase);
	var priority = arrayId[4];

	//Attempt to find a variation of the sound that is not playing
	var rrNumber = sound_effect_get_rr_number(arrayId);
	//show_message("RR Num:" + string(rrNumber));

	for (i = 5; i < 5 + rrNumber; i++){
		if (!audio_is_playing(arrayId[i])){
			soundToPlay = arrayId[i];
			break;
		}
	}

	//Play the sound 
	var soundEffect = audio_play_sound(soundToPlay, priority, loop); 
	audio_sound_gain(soundEffect, volRandomized, 0);
	audio_sound_pitch(soundEffect, 1 + pitchRandomAdd);
	//Randomize RR position
	var oldRR = rrPosition;
	var newRR = oldRR;

	if (rrNumber > 1){
		while (oldRR == newRR){
			newRR = irandom(rrNumber - 1);	
		}
	}else{
		newRR = 0;	
	}

	arrayId[@ 0] = newRR;

	return soundEffect;
}





