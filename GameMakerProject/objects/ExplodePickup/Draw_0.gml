draw_self();
draw_set_color(c_white);
draw_set_font(fnt_Info);
if(collision){
	draw_text(x,y-spriteHeight/2+10,"PRESS Q OR X TO PUT IN FIRST SLOT");
	draw_text(x,y-spriteHeight/2+35,"PRESS E OR B TO PUT IN SECOND SLOT");
}
if(showDesc){
	if(resizeAllowed) draw_rectangle(x-5,y-spriteHeight/2-100,x+string_width("PRESS Q OR X TO PUT IN FIRST SLOT")+5,y-spriteHeight/2+box_size,2);
	else draw_rectangle(x-5,y-spriteHeight/2-100,x+string_width("Item :   " +string(name))+5,y-spriteHeight/2+box_size,2);
	draw_text(x,y-spriteHeight/2-95,"Item : " +string(name));
	draw_text(x,y-spriteHeight/2-70,"Damage : " +string(thisInstance.damage*100));
	draw_text(x,y-spriteHeight/2-45,"Range : " +string(thisInstance.range));
}