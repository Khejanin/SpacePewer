event_inherited();
step = 20;
hp = 50;
maxHP = hp;
type = obj_Player;
noMod = instance_create_layer(x,y,"Entities",Modification);
if(global.playerMod1 != noone){
	mod1 = global.playerMod1.thisInstance;
	GUI.mod1 = global.playerMod1;
}
else mod1 = noMod;
if(global.playerMod2 != noone){
	mod2 = global.playerMod2.thisInstance;
	GUI.mod2 = global.playerMod2;
}
else mod2 = noMod;
if(global.playerWeapon != noone){
	weapon = global.playerWeapon.thisInstance;
	global.playerWeapon.thisInstance.persistent= false;
	weapon.owner = object_index;
	GUI.weapon = global.playerWeapon;
}else{
	var weap = instance_create_layer(0,0,"Entities",obj_NormalWeaponPickup);
	weapon = weap.thisInstance;
	weap.resizeAllowed = false;
	weap.visible = true;
	GUI.weapon = weap.id;
	weapon.owner = object_index;
}
regeneration = 0.2;
regenerationStep = 10;
global.mp_grid = mp_grid_create(0,0,room_width/65,room_height/65,65,65);
mp_grid_add_instances(global.mp_grid,obj_Wall,false);
baseMaxXP = 250;
baseMaxHP = 50;
oldMouseXOffset = x - mouse_x;
oldMouseYOffset = y - mouse_y;
mouse = true;
gamepad = false;
level = global.level;
outOfCombatTick = 0;
event_user(0);
if(global.playerX != -1){
	x = global.playerX;
}
if(global.playerY != -1){
	y = global.playerY;
}
if(global.xp != -1){
	xp = global.xp;
}else xp = 0;
