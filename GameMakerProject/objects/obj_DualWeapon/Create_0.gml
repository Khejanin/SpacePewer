event_inherited();
name = "Dual Weapon";
baseDmg = random_range(2,6);
damage = baseDmg*sqrt(global.level*baseDmg);
fire = false;
owner = noone;
cooldown = random_range(10,15);
cooldownValue = cooldown;