/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

destX = obj_Player.x;
destY = obj_Player.y;

if(active){
	event_inherited();
	if(!canMove && cooldown <= 0){
		var front_pos_Y = y-sprite_height/2*sin(degtorad(image_angle+90));
		var front_pos_X = x+sprite_width/2*cos(degtorad(image_angle+90));
		var obj = instance_create_layer(front_pos_X,front_pos_Y,"BulletLayer",obj_Projectile_Big);
		obj.image_index = image_index;
		obj.creator = type;
		obj.direction = image_angle+90;
		obj.directionSet = true;
		cooldown = cooldownValue;
		}
	cooldown--;
}

if(distance_to_object(obj_Player) < range){
	canMove = false;
}else canMove = true;

if(distance_to_object(obj_Player) < activeRange){
	active = true;
}else active = false;