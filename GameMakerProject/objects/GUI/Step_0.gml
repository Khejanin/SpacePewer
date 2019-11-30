if(room == space && instance_exists(obj_Player.mod1) || instance_exists(obj_Player.mod2)){
	if(obj_Player.mod1.object_index != Modification) {
			text[0] = obj_Player.mod1.name;
		}
	else {
		text[0] = "  Mod 1";
		mod1 = noone;
		}
	if(obj_Player.mod2.object_index != Modification) {
			text[2] = obj_Player.mod2.name;
		}
	else {
		text[2] = "  Mod 1";
		mod2 = noone;
	}
	if(instance_exists(obj_Player.weapon) && obj_Player.weapon != noone) {
			text[1] = obj_Player.weapon.name;
	}
	else weapon = noone;
	if(keyboard_check(vk_tab) || gamepad_button_check(0,gp_shoulderl) || gamepad_button_check(0,gp_shoulderr)){
		if(instance_exists(mod1)) mod1.showDesc = true;
		if(instance_exists(mod2)) mod2.showDesc = true;
		if(instance_exists(weapon)) weapon.showDesc = true;
	}
	else {
		if(instance_exists(mod1)) mod1.showDesc = false;
		if(instance_exists(mod2)) mod2.showDesc = false;
		if(instance_exists(weapon)) weapon.showDesc = false;
	}
}
