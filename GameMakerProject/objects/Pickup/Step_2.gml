if(pickUpTimeout < 0){
	if(keyboard_check(ord("E")) || gamepad_button_check(0,gp_face1)){
		if(collision){
			audio_sound_pitch(snd_Pickup,random_range(0.8,1.2));
			audio_play_sound(snd_Pickup,-100,false);
			var pickUp = createPickup(x,y,obj_Player.weapon);
			pickUp.thisInstance = obj_Player.weapon;
			obj_Player.weapon = thisInstance;
			if(instance_exists(GUI.weapon)) with(GUI.weapon) instance_destroy();
			resizeAllowed = false;
			image_xscale = 1;
			image_yscale = 1;
			GUI.weapon = id;
		}
	}
}
pickUpTimeout--;