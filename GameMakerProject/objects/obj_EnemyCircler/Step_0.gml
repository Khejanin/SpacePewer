destX = obj_Player.x;
destY = obj_Player.y;

event_inherited();
if(cooldown <= 0 && distance_to_object(obj_Player) < range){
	var obj = instance_create_layer(x,y,"BulletLayer",projectile);
	obj.creator = type;
	obj.image_index = image_index;
	obj.image_angle = obj.direction;
	cooldown = cooldownValue;
	instance_destroy();
}
cooldown--;