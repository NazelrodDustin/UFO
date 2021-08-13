/*
if (!audio_is_playing(snd_song) && playSong){
	song = audio_play_sound(snd_song, 9999, false);
	audio_sound_gain(song, 1, 10);	
}else if (audio_is_playing(snd_song) && playSong){
	var audioPosition = audio_sound_get_track_position(song);	
	
	if (audioPosition >= ambienceTransitionPoint){		
		if (!audio_is_playing(snd_ambience)){
			ambience = audio_play_sound(snd_ambience, 9999, true);
			audio_sound_gain(ambience, 0, 10)
			audio_sound_gain(ambience, 1, ambienceTransitionTime * 1000);
			audio_sound_gain(song, 0, ambienceTransitionTime * 1000);
		}
		
		if (audio_sound_get_gain(song) <= 0.1){
			playSong = false;
			song = -1;
			audio_stop_sound(snd_song);
		}
	}
}else if (!playSong && audio_is_playing(snd_ambience)){
	musicTimer ++;
	
	if (musicTimer >= framesBetweenMusic){
		if (!audio_is_playing(snd_song)){
			song = audio_play_sound(snd_song, 9999, false);
			audio_sound_gain(ambience, 0, ambienceTransitionTime * 1000);
		}
		
		if (audio_sound_get_gain(ambience) <= 0){
			framesBetweenMusic = irandom_range(3600, 5000);
			playSong = true;
			musicTimer = 0;
			audio_stop_sound(snd_ambience);
		}
	}
}