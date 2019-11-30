draw_self();
draw_set_font(fnt_Info);
draw_set_color(c_black);
draw_text(x+sprite_width/2,y+sprite_height/2,"New Game");
if(sure && game_exists) draw_text(x+sprite_width/2,y+sprite_height/2+50,"You sure ? There's already a Game Saved !");