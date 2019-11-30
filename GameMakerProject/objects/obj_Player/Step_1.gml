var xOff = 0;
var yOff = 0;
if(keyboard_check(ord("A"))) {
	if(!place_meeting(x-step,y,obj_Wall)) xOff-= step;
}
if(keyboard_check(ord("D"))){
	if(!place_meeting(x+step,y,obj_Wall)) xOff+= step;
}
if(keyboard_check(ord("S"))){
	if(!place_meeting(x,y+step,obj_Wall)) yOff+= step;
}
if(keyboard_check(ord("W"))){
	if(!place_meeting(x,y-step,obj_Wall)) yOff-= step;
}
if(abs(gamepad_axis_value(0,gp_axislh)) > 0.1){
	var xOff = gamepad_axis_value(0,gp_axislh) * step;
	if(place_meeting(x+xOff,y,obj_Wall)) xOff = 0;
}
if(abs(gamepad_axis_value(0,gp_axislv)) > 0.1){
	var yOff = gamepad_axis_value(0,gp_axislv) * step;
	if(place_meeting(x,y+yOff,obj_Wall)) yOff = 0;
}
if(keyboard_check(vk_space)){
	xp += 100;
	audio_stop_all();
}

var haxis = gamepad_axis_value(0, gp_axisrh);
var vaxis = gamepad_axis_value(0, gp_axisrv);

if(abs(haxis) > 0.2 || abs(vaxis) > 0.2){
	gamepad = true;
}
else gamepad = false;
if(oldMouseXOffset != display_mouse_get_x() && oldMouseYOffset != display_mouse_get_y()) mouse = true;
else mouse = false;


if(angle_allowed){
	if(gamepad)
		direction = point_direction(0, 0, haxis, vaxis);
	else if(mouse){
		direction = point_direction(x,y,mouse_x,mouse_y);
	}
	image_angle = -90+ direction;
}

oldMouseXOffset = x - mouse_x;
oldMouseYOffset = y - mouse_y;

if(xOff != 0 && yOff != 0){
	xOff = xOff * 0.707;
	yOff = yOff * 0.707;
}

x += xOff;
y +=yOff;

front_pos_Y = y-sprite_height/2*sin(degtorad(image_angle+90));
front_pos_X = x+sprite_width/2*cos(degtorad(image_angle+90));