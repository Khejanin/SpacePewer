if(xChunkOff < -1){
	tilemap_x(tilemap,2*global.playerRoomSize);
	xChunkOff = 1;
	generateChunk(tilemap,global.xChunk+xChunkOff,global.yChunk +yChunkOff,id);
	generated = true;
}
else if(xChunkOff > 1){
	tilemap_x(tilemap,0);
	xChunkOff = -1;
	generateChunk(tilemap,global.xChunk+xChunkOff,global.yChunk +yChunkOff,id);
	generated = true;
}
else if(yChunkOff < -1){
	tilemap_y(tilemap,2*global.playerRoomSize);
	yChunkOff = 1;
	generateChunk(tilemap,global.xChunk+xChunkOff,global.yChunk +yChunkOff,id);
	generated = true;
}
else if(yChunkOff > 1){
	tilemap_y(tilemap,0);
	yChunkOff = -1;
	generateChunk(tilemap,global.xChunk+xChunkOff,global.yChunk +yChunkOff,id);
	generated = true;
}
x = tilemap_get_x(tilemap);
y = tilemap_get_y(tilemap);