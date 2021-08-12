audio_listener_orientation(0, 1, 0, 0, 0, 1);
audio_falloff_set_model(audio_falloff_exponent_distance);

//Create varied samples
soundLazerRifle = sound_effect_create_varied_sample(200, 600, 2, "snd_laserRifle", 1, .1, .01, 50);	

soundBarrierPlace = sound_effect_create_varied_sample(200, 600, 2, "snd_barrierPlace", .1, .1, .01, 50);	
