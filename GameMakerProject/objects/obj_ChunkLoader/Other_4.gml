var minChunk = -1;
var maxChunk = 1;

global.chunk_layer = layer_create(349);


var z = 0;
for(var i = minChunk; i <= maxChunk ; i++){
	for(var j = minChunk; j <= maxChunk; j++){
		chunks[z] = instance_create_layer(0,0,"Walls",obj_Chunk);
		//(helpNumber+2*i)*0.5 always gives us the middle
		var posX = global.playerRoomSize * (i+1);
		var posY = global.playerRoomSize * (j+1);
		
		var tilemap =layer_tilemap_create(global.chunk_layer,posX,posY,Background,global.playerRoomSize,global.playerRoomSize);
			
		chunks[z].tilemap = tilemap;
		chunks[z].xChunkOff = i;
		chunks[z].yChunkOff = j;
		generateChunk(tilemap,global.xChunk+i,global.yChunk+j,chunks[z]);
		z++;
	}
}