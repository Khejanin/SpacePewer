event_inherited();
if(!active){
	if(child != noone) child.active = false;
	instance_destroy();
}
if(visible && range > 0){
	var front_pos_Y = y-sprite_height/2*sin(degtorad(image_angle+90));
	var front_pos_X = x+sprite_width/2*cos(degtorad(image_angle+90));
	var obj = instance_create_layer(front_pos_X,front_pos_Y,"BulletLayer",obj_Projectile_Fat);
	obj.range = --range;
	obj.directionSet = true;
	obj.direction = direction;
	obj.image_index = image_index;
	obj.creator = creator;
	range = 0;
}
if(destroy) instance_destroy();