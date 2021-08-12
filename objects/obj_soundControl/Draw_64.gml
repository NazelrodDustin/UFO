/*var songGain = 0;
var ambienceGain = 0;
var songTrackPos = 0;

if (audio_is_playing(song)){
	songGain = audio_sound_get_gain(song);	
	songTrackPos = audio_sound_get_track_position(song);
}

if (audio_is_playing(ambience)){
	ambienceGain = audio_sound_get_gain(ambience);	
}

draw_text(10, 10, "Song Gain: " + string(songGain));
draw_text(10, 30, "Ambience Gain: " + string(ambienceGain));
draw_text(10, 50, "Music Timer: " + string(musicTimer));
draw_text(10, 70, "Frames Between Music: " + string(framesBetweenMusic));
draw_text(10, 90, "Play Song: " + string(playSong));
draw_text(10, 110, "Song Track Pos: " + string(songTrackPos));
draw_text(10, 130, "Ambience Transition Point: " + string(ambienceTransitionPoint));