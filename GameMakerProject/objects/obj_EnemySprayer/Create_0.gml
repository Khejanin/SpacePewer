baseHP = 75;
baseXP = 15;
rarity = 2;
event_inherited();
shots = clamp(sqrt(global.level),1,10);
projectile = obj_Projectile_Small;
range = irandom_range(150,500)*sqrt(global.level);
cooldownValue = 30;