/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(!follow) {
	canMove = false;
	range = 0;
	}
event_inherited();
if(!follow && !collision_line(x,y,obj_Player.x,obj_Player.y,obj_Wall,false,true)){
	followTick++;
	if(followTick >= 10){
		follow = true;
		range = baseRange;
	}
}
else followTick = 0;