#region Create varied samples


if (!audio_group_is_loaded(SFX)){
	audio_group_load(SFX);
}

if (!audio_group_is_loaded(Songs)){
	audio_group_load(Songs);
}



soundBarrierDamage = sound_effect_create("snd_barrierDamage", 1, .1, .01, 500);
soundBarrierPlace = sound_effect_create("snd_barrierPlace", 1, .1, .01, 10);
soundFootstep = sound_effect_create("snd_footstep", 1, .1, .01, 70);
soundLaserRifle = sound_effect_create("snd_laserRifle", 1, .1, .01, 20);	
soundPlayerHurt = sound_effect_create("snd_playerHurt", 1, .1, .01, 700);
soundZombieDying = sound_effect_create("snd_zombieDying", 1, .1, .01, 5);
soundZombieGeneral = sound_effect_create("snd_zombieGeneral", 1, .1, .01, 1);

soundPlayerDeath = sound_effect_create("snd_playerDeath", 1, .1, .01, 700);
soundPlayerSpawn = sound_effect_create("snd_playerSpawn", 1, .1, .01, 700);
soundPortalDespawn = sound_effect_create("snd_portalDespawnc", 1, .1, .01, 1000);
soundPortalSpawn = sound_effect_create("snd_portalSpawn", 1, .1, .01, 1000);
soundRadioPlace = sound_effect_create("snd_radioTowerSpawn", 1, .1, .01, 200);
soundCrash = sound_effect_create("snd_ufoCrashing", 1, .1, .01, 600);
soundSalvage = sound_effect_create("snd_ufoSalvage", 1, .1, .01, 200);


#endregion



//Music
framesBetweenMusic = irandom_range(3600, 5000);
musicTimer = 0;
songLength = audio_sound_length(snd_song);
playSong = true;
ambienceTransitionTime = round(songLength / 12);
ambienceTransitionPoint = songLength - ambienceTransitionTime;
ambience = -1;
mute = true;

songAmbLevel = .8;
global.sfxLevel = .8;
