if(creator == obj_Player) {
	var otherMod = noone;
	if(explode != noone){
		if(other.hp <= damage){
			other.debuff = Explode;
		}
		otherMod = Explode;
	}
	if(chain != noone){
		var nextChain = instance_create_layer(x,y,"Entities",Chain);
		var arr = layer_get_all_elements("Enemies");
		var list = ds_list_create()
		var enem = instance_nearest(x,y,obj_EnemyEntity);
		for(var i = 0; i < array_length_1d(arr);i++){
			var inst = layer_instance_get_instance(arr[i]);
			if(instance_exists(inst)){
				if(inst.id != enem.id){
					ds_list_add(list,inst);
				}
			}
		}
		nextChain.enemies = list;
		nextChain.enemy = enem;
		nextChain.otherMod = otherMod;
		nextChain.enemiesSet = true;
	}
	other.hp -= damage;
	if(other.hp <= 0){
		creator.xp += other.xpReward;
		audio_sound_pitch(snd_Die,random_range(0.8,1.2));
		audio_play_sound(snd_Die,-100,false);
	}
	instance_destroy();
}