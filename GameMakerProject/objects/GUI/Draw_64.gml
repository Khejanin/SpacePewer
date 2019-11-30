if(room == space){
width = display_get_gui_width();
height = display_get_gui_height();


for(var i = 0; i < 3; i++){
	if(i == 0){
		posX = offset;
		posY = height - offset;
	}
	else if(i == 1){
		posX = width - box_size-2*offset;
		posY = height - offset;
	}
	else if(i == 2){
		posX = 2*box_size+offset;
		posY = height - offset;
	}
	draw_set_color(c_orange);
	draw_rectangle(posX,height-offset-box_size,posX+box_size,height-offset,false);
	draw_set_color(c_white);
	draw_rectangle(posX,height-offset-box_size,posX+box_size,height-offset,true);

	draw_text(posX,height-offset,text[i]);
	if(i == 0){
		if(mod1 != noone){
			mod1.x = posX;
			mod1.y = height-offset-box_size;
			with(mod1) event_perform(ev_draw,0);
		}
		else draw_text(posX+25,height-offset-box_size/2-15,"None");
	}
	if(i == 1){
		if(weapon != noone){
			weapon.x = posX;
			weapon.y = height-offset-box_size;
			with(weapon) event_perform(ev_draw,0);
		}
		
	}
	if(i == 2){
		if(mod2 != noone){
		mod2.x = posX;
		mod2.y = height-offset-box_size;
		with(mod2) event_perform(ev_draw,0);
	}
		else draw_text(posX+25,height-offset-box_size/2-15,"None");
	}
}
}