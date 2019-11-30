xChunk = global.xChunk + (x div global.playerRoomWidth-1);
yChunk = global.yChunk + (y div global.playerRoomWidth-1);
absolutePosX = global.xChunk * global.playerRoomWidth + x;
absolutePosY = global.yChunk * global.playerRoomHeight + y;
type = obj_Entity;