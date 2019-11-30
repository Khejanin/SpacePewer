xChunk = absolutePosX div global.playerRoomWidth;
yChunk = absolutePosY div global.playerRoomHeight;

var point = instance_create_layer(absolutePosX, absolutePosY, "Entities", obj_Point);
point = worldPosToRoomPos(point);
	
x = point.x;
y = point.y;
	
point.destroy = true;

image_angle = point_direction(obj_Player.x,obj_Player.y,x,y)+90;

if(hp <= 0){
	instance_destroy();
}

if(distance_to_object(obj_Player) > 15000){
	instance_destroy();
}
