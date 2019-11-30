/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event



if(shootingState){
	if((destX == obj_Player.x && destY == obj_Player.y) || (x <= destX +sprite_width/2 && x >= destX -sprite_width/2 && y >= destY -sprite_height/2 && y <= destY +sprite_height/2)){
		var dir = irandom(360);
		destX = obj_Player.x + range * cos(dir);
		destY = obj_Player.y + range * sin(dir);
	}
}
else{
	destX = obj_Player.x;
	destY = obj_Player.y;
}
event_inherited();
if(cooldown <= 0 && distance_to_object(obj_Player) < range){
	for(var i = -shotAngle*(shots-1)/2;i <= shotAngle*(shots-1)/2; i+=shotAngle){
		var front_pos_Y = y-sprite_height/2*sin(degtorad(image_angle+90+i));
		var front_pos_X = x+sprite_width/2*cos(degtorad(image_angle+90+i));
		var obj = instance_create_layer(front_pos_X,front_pos_Y,"BulletLayer",projectile);
		obj.creator = type;
		obj.damage = damage;
		obj.directionSet = true;
		if(projectileRange > 0) obj.range = projectileRange;
		obj.direction = image_angle+90+i;
		obj.image_index = image_index;
		obj.image_angle = obj.direction;
	}
	audio_sound_pitch(projectile.sound,random_range(0.5,1));
	audio_play_sound(projectile.sound,-100,false);
	cooldown = cooldownValue;
}

cooldown--;