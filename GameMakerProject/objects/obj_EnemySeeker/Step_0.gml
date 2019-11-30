/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(x >= obj_Player.x - spd && x <= obj_Player.x + spd && y >= obj_Player.y - spd && y <= obj_Player.y + spd){
	flankState = true;
	var dir = irandom(360);
	destX = x + circleRange * cos(dir);
	destY = y + circleRange * sin(dir);
	audio_play_sound(snd_Hit,0,false);
}
if(flankState && x >= destX - spd && x <= destX + spd && y >= destY - spd && y <= destY + spd){
	flankState = false;
}
if(!flankState){
	destX = obj_Player.x;
	destY = obj_Player.y;
}
event_inherited();

image_angle = direction+90;
