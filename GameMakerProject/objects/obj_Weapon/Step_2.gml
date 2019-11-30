if(owner != noone){
	var haxis = gamepad_axis_value(0, gp_axisrh);
	var vaxis = gamepad_axis_value(0, gp_axisrv);
	if(mouse_check_button(mb_left) && cooldown <= 0) {
		var bullet = instance_create_layer(owner.front_pos_X,owner.front_pos_Y,"BulletLayer",obj_Bullet);
		bullet.creator = owner.type;
		bullet.directionSet = true;
		bullet.damage = damage;
		if(owner.mod1.object_index == Homing || owner.mod2.object_index == Homing) bullet.homing = instance_create_layer(x,y,"Entities",Homing);
		if(owner.mod1.object_index == Explode || owner.mod2.object_index == Explode) bullet.explode = Explode;
		if(owner.mod1.object_index == Chain || owner.mod2.object_index == Chain) bullet.chain = Chain;
		bullet.speed = bulletSpeed;
		//cooldown  = cooldownValue; //normal shooting
		cooldown = cooldown*3/4 + cooldownValue; //burst when not on cd
		if(cooldown >= 0){
			audio_sound_pitch(snd_Pew,random_range(0.8,1.2));
			audio_play_sound(snd_Pew,-100,false);
		}
	}
	else if((abs(haxis) > 0.2 || abs(vaxis) > 0.2) && cooldown <= 0){
		var bullet = instance_create_layer(owner.front_pos_X,owner.front_pos_Y,"BulletLayer",obj_Bullet);
		bullet.creator = owner.type;
		bullet.directionSet = true;
		bullet.damage = damage;
		if(owner.mod1.object_index == Homing || owner.mod2.object_index == Homing) bullet.homing = instance_create_layer(x,y,"Entities",Homing);
		if(owner.mod1.object_index == Explode || owner.mod2.object_index == Explode) bullet.explode = Explode;
		if(owner.mod1.object_index == Chain || owner.mod2.object_index == Chain) bullet.chain = Chain;
		bullet.speed = bulletSpeed;
		//cooldown  = cooldownValue; //normal shooting
		cooldown = cooldown*3/4 + cooldownValue; //burst when not on cd
		if(cooldown >= 0){
			audio_sound_pitch(snd_Pew,random_range(0.8,1.2));
			audio_play_sound(snd_Pew,-100,false);
		}
	}
	cooldown--;
}