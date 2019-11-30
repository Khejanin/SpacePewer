
	var a = layer_get_all_elements("BulletLayer");
	var b = layer_get_all_elements("Enemies");
	var c = layer_get_all_elements("Walls");
	var d = layer_get_all_elements("Entities");
	var e = layer_get_all_elements("Clutter");
	var xOff = 0;
	var yOff = 0;
	if(obj_Player.x >= 2*global.playerRoomWidth){
		xOff -= global.playerRoomWidth;
		global.xChunk++;
	}
	else if(obj_Player.x < global.playerRoomWidth){
		xOff += global.playerRoomWidth;
		global.xChunk--;
	}
	if(obj_Player.y >= 2*global.playerRoomHeight){
		yOff -= global.playerRoomHeight;
		global.yChunk++;
	}
	else if(obj_Player.y < global.playerRoomHeight){
		yOff += global.playerRoomHeight;
		global.yChunk--;
	}
	if(xOff != 0 || yOff != 0){
		obj_Player.angle_allowed = false;
		alarm[0] = 2;
	}
	
	if(xOff != 0 || yOff != 0){
		global.spawn = true;
		obj_Player.x += xOff;
		obj_Player.y += yOff;
	
		for (var i = 0; i < max(array_length_1d(a),array_length_1d(b),array_length_1d(c),array_length_1d(d),array_length_1d(e)); i++;)
		{
			if(i < array_length_1d(a)){
				var instance = layer_instance_get_instance(a[i]);
				instance.x += xOff;
				instance.y += yOff;
				if(instance.destroy){
					with(instance) instance_destroy();
				}
			}
			if(i < array_length_1d(b)){
				if(xOff != 0 || yOff != 0){
					var instance = layer_instance_get_instance(b[i]);
					instance.canMove = false;
				}
			}
			if(i < array_length_1d(c)){
				if(xOff != 0 || yOff != 0){
					var instance = layer_instance_get_instance(c[i]);
					instance.x += xOff;
					instance.y += yOff;
				}
			}
			if(i < array_length_1d(d)){
				if(xOff != 0 || yOff != 0){
					var instance = layer_instance_get_instance(d[i]);
					if(instance_exists(instance)){
						instance.x += xOff;
						instance.y += yOff;
					}
				}
			}
			if(i < array_length_1d(e)){
				if(xOff != 0 || yOff != 0){
					var instance = layer_instance_get_instance(e[i]);
					if(instance_exists(instance)){
						instance.x += xOff;
						instance.y += yOff;
					}
				}
			}
		}
		var chunks = obj_ChunkLoader.chunks;
		for(var i = 0; i < array_length_1d(chunks);i++){
			var tilemap = chunks[i].tilemap;
			tilemap_x(tilemap,tilemap_get_x(tilemap)+xOff);
			tilemap_y(tilemap,tilemap_get_y(tilemap)+yOff);
			chunks[i].xChunkOff += xOff / global.playerRoomSize;
			chunks[i].yChunkOff += yOff / global.playerRoomSize;
			chunks[i].generated = false;
		}
	}
	global.playerPosX = global.playerRoomWidth * global.xChunk + obj_Player.x;
	global.playerPosY = global.playerRoomHeight * global.yChunk + obj_Player.y;