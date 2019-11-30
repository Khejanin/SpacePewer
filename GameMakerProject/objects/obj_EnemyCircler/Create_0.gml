/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
baseHP = 30;
baseXP = 5;
rarity = 2;
event_inherited();
projectile = obj_Projectile_Nova;
range = 100;
cooldownValue = 100;
cooldown = cooldownValue;
spd = clamp(irandom_range(10,15*sqrt(global.level)),10,25);