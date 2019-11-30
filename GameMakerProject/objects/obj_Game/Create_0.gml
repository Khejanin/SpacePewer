window_set_fullscreen(true);
global.dir = "save/";
global.level = 1;
global.save = global.dir + "data.txt";
escDelay = 0;
global.xChunk = 0;
global.yChunk = 0;
global.spaceSize = 10752;
global.playerRoomWidth = global.spaceSize/3;
global.playerRoomHeight = global.spaceSize/3;
global.playerRoomSize =  global.spaceSize/3;
global.spawn = true;

global.playerWeapon = noone;
global.playerMod1 = noone;
global.playerMod2 = noone;
global.playerX = -1;
global.playerY = -1;
global.xp = -1;


enum Weapons{
	normalWeapon,
	dualWeapon
}
enum Modifications{
	none,
	Chain,
	Explode,
	Homing
}