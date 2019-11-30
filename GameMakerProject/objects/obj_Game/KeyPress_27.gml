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
	global.spawn = false;
}
else if(room == menu) game_end();