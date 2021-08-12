#region Create varied samples

soundLaserRifle = sound_effect_create("snd_laserRifle", 1, .1, .01, 100);	
soundBarrierPlace = sound_effect_create("snd_barrierPlace", 1, .1, .01, 50);	
soundRadioPlace = sound_effect_create("snd_radioTowerSpawn", 1, .1, .01, 50);
soundSalvage = sound_effect_create("snd_ufoSalvage", 1, .1, .01, 50);

#endregion



//Music
framesBetweenMusic = irandom_range(3600, 5000);
musicTimer = 0;
songLength = audio_sound_length(snd_song);
playSong = true;
ambienceTransitionTime = round(songLength / 12);
ambienceTransitionPoint = songLength - ambienceTransitionTime;
ambience = -1;


