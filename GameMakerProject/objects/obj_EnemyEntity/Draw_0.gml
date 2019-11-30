var pc = hp/maxHP*100;
draw_set_font(fnt_HealthEnemy);

draw_healthbar(x-sprite_width/2,y-sprite_height/2-20,x+sprite_width/2,y-sprite_height/2,pc,c_black,c_red,c_green,0,true,true);
draw_text(x-20,y-sprite_height/2-22,string(hp));
/*draw_text(x,y+sprite_height+10,string(xpReward));*/
draw_self();