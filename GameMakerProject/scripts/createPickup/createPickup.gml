x = argument[0];
y = argument[1];
object = argument[2];
if(object.object_index == Chain){
	return instance_create_layer(x,y,"Entities",ChainPickup);
}
else if(object.object_index == Explode){
	return instance_create_layer(x,y,"Entities",ExplodePickup);
}
else if(object.object_index == Homing){
	return instance_create_layer(x,y,"Entities",ChainPickup);
}
else if(object.object_index == obj_NormalWeapon){
	return instance_create_layer(x,y,"Entities",obj_NormalWeaponPickup);
}
else if(object.object_index == obj_DualWeapon){
	return instance_create_layer(x,y,"Entities",obj_DualWeaponPickup);
}