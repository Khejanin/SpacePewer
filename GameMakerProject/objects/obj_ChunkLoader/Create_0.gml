global.tileSize = 512;
oldXChunk = -100;
oldYChunk = -100;
global.playerRoomSize = room_width/3;
global.floorTile = 4;
global.wallTile = 1;
if(global.seed == 0){
	randomize();
	global.seed = random_get_seed();
}
//show_message(string(global.seed));
global.walls = array_create(100,[pointer_null]);
global.isGenerating = false;
chunks = array_create(9,[obj_Chunk]);