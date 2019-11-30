/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
path = path_add();
spd = 20;
range = 200;
canMove = true;
pathcd = 200;
followPath = false;
mp_grid_path(global.mp_grid,path,x,y,obj_Player.x,obj_Player.y,true);
pos = 1;
xx = 0;
yy = 0;
destX = 0;
destY = 0;
angleSpd = 15;
followTimer = 0;