



/*if(mouse_check_button(mb_left) && cooldown <= 0) {
	var bullet = instance_create_layer(front_pos_X,front_pos_Y,"BulletLayer",obj_Bullet);
	bullet.creator = type;
	bullet.directionSet = true;
	if(mod1.object_index == Homing || mod2.object_index == Homing) bullet.homing = instance_create_layer(x,y,"Entities",Homing);
	if(mod1.object_index == Explode || mod2.object_index == Explode) bullet.explode = Explode;
	if(mod1.object_index == Chain || mod2.object_index == Chain) bullet.chain = Chain;
	//cooldown  = cooldownValue; //normal shooting
	cooldown = cooldown*3/4 + cooldownValue; //burst when not on cd
}
cooldown--;*/
event_inherited();
//spawnEnemies();
if(outOfCombatTick >= 100 && regenerationStep <= 0){
	hp += regeneration;
	regenerationStep = 10;
}
if(instance_nearest(x,y,obj_EnemyEntity) < 500) if(outOfCombatTick<100) outOfCombatTick++;
else outOfCombatTick = 0;
regenerationStep--;
if(xp >= maxXP){
	xp %= maxXP;
	level++;
	global.level = level;
	event_user(0);
}

if(hp <= 0){
	//game_restart();	
}