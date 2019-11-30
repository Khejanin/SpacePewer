if(instance_exists(obj_Player)){
	if(instance_exists(obj_Player.weapon)){
		playerWeaponIndex = obj_Player.weapon.object_index;
		playerWeaponDamage = obj_Player.weapon.damage;
		playerWeaponCooldown = obj_Player.weapon.cooldown;
	}
	/*if(instance_exists(obj_Player.mod1){
		playerMod1 = obj_Player.mod1;
	}*/
}

if(room == menu && !audio_is_playing(snd_menuMusic)){
	audio_stop_all();
	audio_play_sound(snd_menuMusic,1,true);
}
if(room == space || room == gamemenu){
	if(audio_is_playing(snd_menuMusic)) audio_stop_sound(snd_menuMusic);
	if(!audio_is_playing(snd_track1) && !audio_is_playing(snd_track2) && !audio_is_playing(snd_track3) && !audio_is_playing(snd_track4)){
		var sound = choose(snd_track1,snd_track2,snd_track3,snd_track4);
		audio_play_sound(sound,1,false);
	}		
}


if(gamepad_button_check(0,gp_start) && escDelay <=0){
	escDelay = 30;
if(room == space) {
	global.playerWeapon = GUI.weapon;
	global.playerX = obj_Player.x;
	global.playerY = obj_Player.y;
	global.playerWeapon.persistent = true;
	global.playerWeapon.thisInstance.persistent = true;
	global.playerWeapon.thisInstance.owner = noone;
	global.playerMod1 = GUI.mod1;
	global.playerMod2 = GUI.mod2;
	room_goto_next();
	}
else if(room == gamemenu) {
	room_goto_previous();
}
else if(room == menu) game_end();
}

escDelay--;