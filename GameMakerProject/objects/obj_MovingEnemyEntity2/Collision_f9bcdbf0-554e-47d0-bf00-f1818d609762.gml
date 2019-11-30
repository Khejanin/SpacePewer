/*var wall = instance_nearest(x,y,obj_Wall);
var wallDirection = point_direction(destX,destY,wall.x,wall.y);

var xSpeed = -spd * cos(degtorad(wallDirection));
var ySpeed = spd * sin(degtorad(wallDirection));

absolutePosX -= xSpeed;
absolutePosY -= ySpeed;
if(pos != path_get_number(path)){
	path_shift(path,xSpeed,ySpeed);
}
canMove = false;*/

move_contact_solid(point_direction(x,y,other.x,other.y),1)