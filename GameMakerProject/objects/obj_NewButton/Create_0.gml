global.dir = "save/";
global.save = global.dir + "data.txt";
game_exists = file_exists(global.save);
sure = true;
if(game_exists) sure = false;