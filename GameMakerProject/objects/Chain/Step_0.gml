if(!immortal){
	if(!done && enemiesSet){
		for(var i = 0; i < ds_list_size(enemies);i++){
			var inst = ds_list_find_value(enemies,i);
			if(inst != undefined){
				var dist = distance_to_object(inst);
				if(dist < range){
					var obj = instance_create_layer(inst.x,inst.y,layer,Chain);
					ds_list_delete(enemies,i);
					obj.enemies = enemies;
					obj.enemy = inst;
					obj.otherMod = otherMod;
					obj.enemiesSet = true;
					ds_list_add(next,obj);
				}
			}
		}
		if(instance_exists(enemy)) {
			if(otherMod == Explode){
				if((instance_exists(enemy)) && enemy.hp <= damage){
					if(instance_exists(enemy)) enemy.debuff = Explode;
				}
			}
			if(instance_exists(enemy)) enemy.hp -= damage;
		}
		done = true;
	}

	if(done && instance_exists(enemy)){
		x = enemy.x;
		y = enemy.y;
	}
	alive--;
	if(alive < 0 || (done && !instance_exists(enemy))) instance_destroy();
}