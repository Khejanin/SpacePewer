if(canMove){
if(collision_line(x,y,obj_Player.x,obj_Player.y,obj_Wall,true,true)){
	path_delete(path);
	path = path_add();
	mp_grid_clear_all(obj_Wall);
	mp_grid_add_instances(global.mp_grid,obj_Wall,true);
	mp_grid_add_instances(global.mp_grid,obj_EnemyEntity,true);
	mp_grid_clear_cell(global.mp_grid,x/65,y/65);
	if(mp_grid_path(global.mp_grid,path,x,y,obj_Player.x,obj_Player.y,true)){
		pos = 1;
		xx = path_get_point_x(path,pos);
		yy = path_get_point_y(path,pos);
		followPath = true;
	}
	else followPath= false;
}
if(!collision_line(x,y,obj_Player.x,obj_Player.y,obj_Wall,true,true)){
	followPath = false;
}
if(!followPath){
	destX = obj_Player.x;
	destY = obj_Player.y;
	
	destDirection = point_direction(destX,destY,x,y);
		
	directionOffset = direction-destDirection;
	
	angle = 0;
	if(abs(directionOffset) > 5){
		if(abs(directionOffset) > 180){
			if(destDirection > direction){
				directionOffset = (360-destDirection)+direction;
			}
			else directionOffset = -((360-direction)+destDirection);
		}
		if(directionOffset > 0) angle = -angleSpd;
		else angle = angleSpd;
	
		if(abs(directionOffset) / abs(angle) > 1) direction += angle;
		else  direction = destDirection-1;
	}

	
	xSpeed = -spd * cos(degtorad(direction));
	ySpeed = spd * sin(degtorad(direction));
	
	if(!place_meeting(x+xSpeed,y+5,obj_Wall)) absolutePosX += xSpeed;
	else if(!place_meeting(x+xSpeed,y-5,obj_Wall)) absolutePosX += xSpeed;
	if(!place_meeting(x+5,y+ySpeed,obj_Wall)) absolutePosY += ySpeed;
	else if(!place_meeting(x-5,y+ySpeed,obj_Wall)) absolutePosY += ySpeed;
	
	followPath = false;
}
else{
	if(point_distance(x,y,xx,yy) < 6){
		pos++;
		if(pos == path_get_number(path)){
			followPath = false;
		}
		else{
			xx = path_get_point_x(path,pos);
			yy = path_get_point_y(path,pos);
		}
	}
	oldX = x;
	oldY = y;
	mp_potential_step(xx,yy,spd,false);
	absolutePosX += x-oldX;
	absolutePosY += y-oldY;
 }
//path_add_point(path,obj_Player.x,obj_Player.y,spd);
}
event_inherited();
canMove = true;