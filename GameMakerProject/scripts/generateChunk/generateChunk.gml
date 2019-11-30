enum dirEnum{
	left,
	right,
	up,
	down
}

global.isGenerating = true;

var tilemap = argument[0];
var xChunk = argument[1];
var yChunk = argument[2];
var chunk = argument[3]

tilemap_clear(tilemap,0);


var chunkTiles = 7;

var a = xChunk;
var b = yChunk;

var tilemapX = tilemap_get_x(tilemap);
var tilemapY = tilemap_get_y(tilemap);

var dir = choose(dirEnum.up,dirEnum.down,dirEnum.left,dirEnum.right);

var posX = chunkTiles/2;
var posY = chunkTiles/2;
//calculate an unique Number with those two Numbers
var uniqueNr = power(2,xChunk) * power(3,yChunk);
//make a unique seed for this chunk based on the global seed
random_set_seed(global.seed*uniqueNr);

//probability for a room to spawn
var roomProb = 10;

if(!(xChunk == 0 && yChunk == 0) && irandom(roomProb) == roomProb){
	var bossPos = false;
	var boss = true;
	chunk.sprite_index = -1;
	var dirChangeProbability = 1;
	var iterations = irandom_range(30,60);
	//this is just the room generation
	for(var p = 0;p < iterations;p++){
		if(irandom(dirChangeProbability) == dirChangeProbability){
			dir = choose(dirEnum.up,dirEnum.down,dirEnum.left,dirEnum.right);
		}
		if(dir == dirEnum.up){
			posY -= 1;
		}
		if(dir == dirEnum.down){
			posY += 1;
		}
		if(dir == dirEnum.left){
			posX -= 1;
		}
		if(dir == dirEnum.right){
			posX += 1;
		}
		//clamp it so it doesnt go out of the chunk -1 for the walls
		posX = clamp(posX,1,chunkTiles-2);
		posY = clamp(posY,1,chunkTiles-2);
		
		if(!bossPos){
			bossPos = true;
			var bossX = tilemapX+posX*512;
			var bossY = tilemapY+posX*512;
		}
	
		tilemap_set(tilemap,4,posX,posY);
	}
	
	//Now Walls
	for(wallX = 0; wallX < chunkTiles; wallX++){
		for(wallY = 0; wallY < chunkTiles; wallY++){
			//check if theres a floor tile at the current place
			if(tilemap_get(tilemap,wallX,wallY) == global.floorTile){
				var inst;
				//if there is, check every direction around it and place walls there there are no floors
				if(tilemap_get(tilemap,wallX+1,wallY) != global.floorTile){
					inst = instance_create_layer((wallX+1)*global.tileSize+tilemapX,(wallY)*global.tileSize+tilemapY,"Walls",obj_Wall);
				
					with(inst){
						xChunk = a;
						yChunk = b;
					}
				}
				if(tilemap_get(tilemap,wallX-1,wallY) != global.floorTile){
					inst = instance_create_layer((wallX-1)*global.tileSize+tilemapX,(wallY)*global.tileSize+tilemapY,"Walls",obj_Wall);
				
					with(inst){
						xChunk = a;
						yChunk = b;
					}
				}
		
				if(tilemap_get(tilemap,wallX,wallY+1) != global.floorTile){
					inst = instance_create_layer((wallX)*global.tileSize+tilemapX,(wallY+1)*global.tileSize+tilemapY,"Walls",obj_Wall);
				
					with(inst){
						xChunk = a;
						yChunk = b;
					}
				}
			
				if(tilemap_get(tilemap,wallX,wallY-1) != global.floorTile){
					inst = instance_create_layer((wallX)*global.tileSize+tilemapX,(wallY-1)*global.tileSize+tilemapY,"Walls",obj_Wall);
				
					with(inst){
						xChunk = a;
						yChunk = b;
					}
				}
			}
		}
	}
	//now check if walls had been destroyed in the current chunk
	var filename = global.dir + string(a)+"_"+string(b)+".txt";

	if(file_exists(filename)){
		boss = false;
		//get the file
		var file = file_text_open_read(filename);
	
		//read
		while(!file_text_eof(file)){
			
			//get coords of walls
			var xx =file_text_read_real(file);
			var yy = file_text_read_real(file);
		
			//the coords are saved between 0 and playerRoomSize, they need to be adapted to the current map layout
			if(xx != 0 && yy != 0){
				var xx = xx +tilemapX;
				var yy = yy + tilemapY;
			
				var wall = instance_position(xx,yy,obj_Wall);
			
				if(wall != noone){
					with(wall) instance_destroy();
				}
			}
		}
		file_text_close(file);
	}
	//set the seed back
	random_set_seed(global.seed);
	global.isGenerating = false;
	if(boss && global.level >=5) instance_create_layer(bossX,bossY,"Enemies",obj_MiniBoss);
}
else{ //No room -> chance for enemies and clutter
	randomize();
	var bgChance = 5;
	if(irandom(bgChance) == bgChance){
		var bg = irandom(100);
		var xx = tilemap_get_x(chunk.tilemap) + global.playerRoomSize/2;
		var yy = tilemap_get_y(chunk.tilemap) + global.playerRoomSize/2;
		if(bg < 60){
			instance_create_layer(xx,yy,"Clutter",obj_BigPlanet);
		}
		else if(bg < 90){
			instance_create_layer(xx,yy,"Clutter",obj_SmallPlanets);
		}
		else if(bg < 100){
			instance_create_layer(xx,yy,"Clutter",obj_Planet);
		}
	}
	else {
		chunk.sprite_index = -1;
	}
	global.isGenerating = false;
	var enemyChance = 1;
	if(global.spawn && irandom(enemyChance) == enemyChance) spawnEnemies(tilemap_get_x(tilemap)+chunkTiles/2*512,tilemap_get_y(tilemap)+chunkTiles/2*512);
	random_set_seed(global.seed);
}
