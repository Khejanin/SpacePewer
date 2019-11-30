if(canMove && !global.isGenerating){
	var wall = instance_nearest(x,y,obj_Wall);
	var wallDirection = point_direction(destX,destY,wall.x,wall.y);

	var xSpeed = -2 * cos(degtorad(wallDirection));
	var ySpeed = 2 * sin(degtorad(wallDirection));

	absolutePosX -= xSpeed;
	absolutePosY -= ySpeed;
}