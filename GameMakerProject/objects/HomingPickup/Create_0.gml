event_inherited();
name = "Homing";
thisInstance = instance_create_layer(x,y,"Entities",Homing);
thisInstance.image_speed = 0;
thisInstance.visible = false;
audio_sound_pitch(snd_Homing,random_range(0.8,1.2));
audio_play_sound(snd_Homing,-100,false);