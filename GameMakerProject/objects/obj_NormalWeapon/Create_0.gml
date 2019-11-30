event_inherited();
name = "Normal Weapon";
baseDmg = random_range(5,9);
damage = baseDmg*sqrt(global.level*baseDmg);
fire = false;
owner = noone;
cooldown = random_range(15,20);
cooldownValue = cooldown;