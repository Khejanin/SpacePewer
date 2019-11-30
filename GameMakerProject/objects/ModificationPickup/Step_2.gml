if(pickUpTimeout < 0){
	if(keyboard_check(ord("Q")) || gamepad_button_check(0,gp_face3)){
		if(collision){
			audio_sound_pitch(snd_Pickup,random_range(0.8,1.2));
			audio_play_sound(snd_Pickup,-100,false);
			if(obj_Player.mod1.object_index != Modification){
				var pickUp = createPickup(x,y,obj_Player.mod1);
				pickUp.thisInstance = obj_Player.mod1;
			}
			obj_Player.mod1 = thisInstance;
			resizeAllowed = false;
			image_xscale = 1;
			image_yscale = 1;
			GUI.mod1 = id;
		}
	}
	if(keyboard_check(ord("E")) || gamepad_button_check(0,gp_face2)){
		if(collision){
			audio_sound_pitch(snd_Pickup,random_range(0.8,1.2));
			audio_play_sound(snd_Pickup,-100,false);
			if(obj_Player.mod2.object_index != Modification){
				var pickUp = createPickup(x,y,obj_Player.mod2);
				pickUp.thisInstance = obj_Player.mod2;
			}
			obj_Player.mod2 = thisInstance;
			if(instance_exists(GUI.mod2)) with(GUI.mod2) instance_destroy();
			resizeAllowed = false;
			image_xscale = 1;
			image_yscale = 1;
			GUI.mod2 = id;
		}
	}
}
pickUpTimeout--;