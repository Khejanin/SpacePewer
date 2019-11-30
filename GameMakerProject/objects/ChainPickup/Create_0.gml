event_inherited();
name = "Lighning Chain"
thisInstance = instance_create_layer(x,y,"Entities",Chain);
thisInstance.immortal = true;
audio_sound_pitch(snd_Chain,random_range(0.8,1.2));
audio_play_sound(snd_Chain,-100,false);