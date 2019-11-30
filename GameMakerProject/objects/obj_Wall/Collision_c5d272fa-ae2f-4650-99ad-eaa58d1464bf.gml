hp--;
if(hp == 0) {
	//var filename = global.dir + string(entityChunkX)+"_"+string(entityChunkY)+".txt";
	var filename = global.dir + string(xChunk)+"_"+string(yChunk)+".txt";
	var file;
	var xx = x%global.playerRoomSize+sprite_width/2;
	var yy = y%global.playerRoomSize+sprite_height/2;
	if(!file_exists(filename)){
		file = file_text_open_write(filename);
	}
	else{
		file = file_text_open_append(filename);
	}
	file_text_write_real(file,xx);
	file_text_write_real(file,yy);
	var xxPosPos = x;
	var yyPosPos = y;
	//Move out of screen temporarily
	x = -sprite_width;
	y = -sprite_height;
	
	//destroy all walls on the same pos.
	var obj = instance_position(xxPosPos+sprite_width/2,yyPosPos+sprite_height/2,obj_Wall);
	while(obj != noone){
		with(obj) instance_destroy();
		var obj = instance_position(xxPosPos+sprite_width/2,yyPosPos+sprite_height/2,obj_Wall);
	}
	file_text_close(file);
	instance_destroy();
}