draw_self();
draw_set_color(c_white);
draw_set_font(fnt_Info);
if(collision){
	draw_text(x,y-spriteHeight/2+10,"PRESS E OR A TO EQUIP");
}
if(showDesc){
	if(thisInstance.damage/thisInstance.cooldownValue > obj_Player.weapon.damage/obj_Player.weapon.cooldownValue) draw_set_color(c_yellow);
	if(resizeAllowed) draw_rectangle(x-5,y-spriteHeight/2-100,x+string_width("PRESS E TO PUT IN SECOND SLOT BLABLA")+5,y-spriteHeight/2+box_size,2);
	else draw_rectangle(x-5,y-spriteHeight/2-100,x+string_width("Shots Per Second : 12.1  ")+5,y-spriteHeight/2+box_size,2);
	draw_text(x,y-spriteHeight/2-95,"Item : " +string(name));
	draw_text(x,y-spriteHeight/2-70,"Damage : " +string(thisInstance.damage));
	draw_text(x,y-spriteHeight/2-45,"Shots Per Second : " +string(60/thisInstance.cooldownValue));
	draw_text(x,y-spriteHeight/2-15,"DPS : " +string(thisInstance.damage*60/thisInstance.cooldownValue));
}