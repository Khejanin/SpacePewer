/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

if(canMove){
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
	
}

if(distance_to_object(obj_Player) <=range){
	shootingState = true;
	canMove = true;
}else {
	shootingState = false;
	canMove = true;
}
event_inherited();
enemyCollision = false;

