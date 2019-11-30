collision = false;
showDesc = false;
name = "Sample Pickup"
sizetimer = 50;
shrink = true;
spriteHeight = 128*2;
box_size = 80;
thisInstance = instance_create_layer(x,y,"Entities",obj_Weapon);
pickUpTimeout = 30;
resizeAllowed = true;
audio_sound_pitch(snd_WeaponPickup,random_range(0.8,1.2));
audio_play_sound(snd_WeaponPickup,-100,false);