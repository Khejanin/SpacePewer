if(debuff == Explode){
	instance_create_layer(x,y,"Entities",Explode);
}
randomize();
var chance = irandom(100);
if(chance <= dropChance){
	var item = irandom(1);
	if(item == 0){
		var whichWeap = irandom(2);
		if(whichWeap == 0){
			var obj = instance_create_layer(x,y,"Entities",obj_NormalWeaponPickup);
		}
		else if(whichWeap == 1){
			var obj = instance_create_layer(x,y,"Entities",obj_DualWeaponPickup);
		}
	}
	else {
		var whichMod = irandom(3);
		if(whichMod == 0){
			instance_create_layer(x,y,"Entities",ChainPickup);
		}else if(whichMod == 1){
			instance_create_layer(x,y,"Entities",ExplodePickup);
		}else if(whichMod == 2){
			instance_create_layer(x,y,"Entities",HomingPickup);
		}
	}
	random_set_seed(global.seed);
}

