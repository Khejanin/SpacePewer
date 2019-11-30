// GameMaker Language Preview (Read-Only)

// If Expression

var midX = argument[0];
var midY = argument[1];

if(array_length_1d(layer_get_all_elements("Enemies")) < 10)
{
	// Function Call
	var count = irandom_range(2*sqrt(global.level),5*sqrt(global.level));

	// Assign Variable
	var angle = 360/count;

	// Assign Variable
	var radius = obj_Player.sprite_width;

	// For Loop
	for(i = 0; i < count; i++) {
		// Assign Variable
		var posX = midX+dcos(i*angle)*radius;
	
		// Assign Variable
		var posY = midY+dsin(i*angle)*radius;
	
		var enemyAdd = 0;
		var higherEnemyChance = irandom(10);
		if(higherEnemyChance == 0) enemyAdd = 1;
		//Choose a random enemy
		var enemy = irandom(global.level div 3 + enemyAdd);
		
		if(enemy == 0) enemy = obj_EnemyDefault;
		else if(enemy == 1) enemy = obj_EnemySeeker;
		else if(enemy == 2) enemy = obj_EnemyCircler;
		else if(enemy == 3) enemy = obj_EnemySprayer;
		else if(enemy == 4) enemy = obj_EnemyElephant;
		
		
		instance_create_layer(posX, posY, "Enemies", enemy);
	}
}
