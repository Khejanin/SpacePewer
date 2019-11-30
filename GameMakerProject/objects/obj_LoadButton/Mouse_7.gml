if(file_exists(global.save)){
	var file;
	visible = false;
	file = file_text_open_read(global.save);
	global.seed = file_text_read_real(file);
	random_set_seed(global.seed);
	var xx = file_text_read_real(file);
	var yy = file_text_read_real(file);
	global.playerPosX = xx;
	global.playerX = xx % global.playerRoomSize;
	global.xChunk = xx div global.playerRoomSize-1;
	global.playerPosY = yy;
	global.playerY = yy % global.playerRoomSize;
	global.yChunk = yy div global.playerRoomSize-1;
	var level = file_text_read_real(file);
	global.level = level;
	global.xp = file_text_read_real(file);
	
	var weaponIndex = file_text_read_real(file);
	global.playerWeapon = noone;
	if(weaponIndex == obj_NormalWeapon) {
		global.playerWeapon = instance_create_layer(0,0,"Entities",obj_NormalWeaponPickup);
	}
	else {
		global.playerWeapon = instance_create_layer(0,0,"Entities",obj_DualWeaponPickup);
	}
	global.playerWeapon.persistent = true;
	global.playerWeapon.thisInstance.persistent = true;
	global.playerWeapon.thisInstance.damage = file_text_read_real(file);
	global.playerWeapon.thisInstance.cooldown = file_text_read_real(file);
	global.playerWeapon.resizeAllowed = false;
	
	var mod1 = file_text_read_real(file);
	global.playerMod1 = noone;
	if(mod1 == Chain){
		global.playerMod1 = instance_create_layer(0,0,"Entities",ChainPickup);
	}
	else if(mod1 == Homing){
		global.playerMod1 = instance_create_layer(0,0,"Entities",HomingPickup);
	}
	else if(mod1 == Explode){
		global.playerMod1 = instance_create_layer(0,0,"Entities",ExplodePickup);
	}
	
	if(global.playerMod1 != noone){
		global.playerMod1.persistent =true;
		global.playerMod1.thisInstance.damage = file_text_read_real(file);
		global.playerMod1.thisInstance.range = file_text_read_real(file);
		global.playerMod1.resizeAllowed = false;
	}
	
	var mod2 = file_text_read_real(file);
	global.playerMod2 = noone;
	if(mod2 == Chain){
		global.playerMod2 = instance_create_layer(0,0,"Entities",ChainPickup);
	}
	else if(mod2 == Homing){
		global.playerMod2 = instance_create_layer(0,0,"Entities",HomingPickup);
	}
	else if(mod2 == Explode){
		global.playerMod2 = instance_create_layer(0,0,"Entities",ExplodePickup);
	}
	
	if(global.playerMod2 != noone){
		global.playerMod2.persistent =true;
		global.playerMod2.thisInstance.damage = file_text_read_real(file);
		global.playerMod2.thisInstance.range = file_text_read_real(file);
		global.playerMod2.resizeAllowed = false;
	}
	
	file_text_close(file);
	room_goto(space);
}
