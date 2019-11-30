if(directionSet){
	if(creator == obj_Player){
		direction = creator.direction + random_range(-4,4);
		/*audio_sound_pitch(sound,random_range(0.8,1.2));
		audio_play_sound(sound,-100,false);*/
	}
	image_angle = direction;
	directionSet = false;
	visible = true;
}
if(homing != noone){
	if(homing.target == noone){
		var inst = instance_nearest(x,y,obj_EnemyEntity);
		if(instance_exists(inst)){
			var dist = distance_to_object(inst);
			if(dist <= homing.range){
				homing.target = inst;
			}
		}
	}
	else{
		if(instance_exists(homing.target)){
			var newDir = point_direction(x,y,homing.target.x,homing.target.y);
			destDirection = point_direction(x,y,homing.target.x,homing.target.y);
		
			directionOffset = direction-destDirection;
	
			angle = 0;
			if(abs(directionOffset) > 5){
				if(abs(directionOffset) > 180){
					if(destDirection > direction){
						directionOffset = (360-destDirection)+direction;
					}
					else directionOffset = -((360-direction)+destDirection);
				}
			if(directionOffset < 15){
				if(directionOffset > 0) angle = -angleSpd;
				else angle = angleSpd;
			
				if(abs(directionOffset) / abs(angle) > 1) direction += angle;
				else  direction = destDirection-1;
			}
			else homing.target = noone;
			}
			image_angle = direction;
		}
		else homing.target = noone;
	}
}
if(destroy) instance_destroy();
destroyTimer--;
if(destroyTimer < 0) destroy = true;