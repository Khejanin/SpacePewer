xChunk = global.xChunk + (x div global.playerRoomWidth-1);
yChunk = global.yChunk + (y div global.playerRoomWidth-1);
absolutePosX = global.xChunk * global.playerRoomWidth + x;
absolutePosY = global.yChunk * global.playerRoomHeight + y;
type = obj_EnemyEntity;
debuff = noone;
level = global.level;
maxHP = baseHP * sqrt(level);
hp = maxHP;
image_index = (level div 5) - rarity;
if(image_index < 0) image_index = 0;
xpReward = baseXP* sqrt(level * (image_index + 1));
dropChance = 30;
damage = sqrt(level)*5;
lootFactor = 1;