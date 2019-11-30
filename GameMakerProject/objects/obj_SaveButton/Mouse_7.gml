var filename = global.save;
var file;
file = file_text_open_write(filename);
file_text_write_real(file,global.seed);
file_text_write_real(file,global.playerPosX);
file_text_write_real(file,global.playerPosY);
file_text_write_real(file,global.level);
file_text_write_real(file,obj_Player.xp);

//Save Weapon
file_text_write_real(file,obj_Game.playerWeaponIndex);
file_text_write_real(file,obj_Game.playerWeaponDamage);
file_text_write_real(file,obj_Game.playerWeaponCooldown);

//Save Modifications
if(obj_Player.mod1.object_index != Modification) {
	file_text_write_real(file,obj_Player.mod1.object_index);
	file_text_write_real(file,obj_Player.mod1.damage);
	file_text_write_real(file,obj_Player.mod1.range);
}
else {
	file_text_write_real(file,-1);
}
if(obj_Player.mod2.object_index != Modification) {
	file_text_write_real(file,obj_Player.mod2.object_index);
	file_text_write_real(file,obj_Player.mod2.damage);
	file_text_write_real(file,obj_Player.mod2.range);
}
else {
	file_text_write_real(file,-1);
}

file_text_close(file);