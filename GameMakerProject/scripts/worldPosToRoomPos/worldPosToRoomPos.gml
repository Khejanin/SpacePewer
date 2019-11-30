var worldPos = argument[0];

worldPos.x = obj_Player.x - (global.playerPosX- worldPos.x);
worldPos.y = obj_Player.y - (global.playerPosY- worldPos.y);

return worldPos;