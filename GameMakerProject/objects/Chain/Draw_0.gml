//draw_text(x,y,ds_list_size(next));
draw_set_color(c_white);
for(var i = 0; i < ds_list_size(next);i++){
	var inst = ds_list_find_value(next,i);
	if(instance_exists(inst)){
		var distX = inst.x-x;
		var distY = inst.y-y;
		if(distX > distY){
			var randomX = random_range(x-distX/2,x+distX/2);
			draw_line(x,y,randomX,y+(distY/2));
			draw_line(randomX,y+(distY/2),inst.x,inst.y);
		}
		else{
			var randomY = random_range(y-distY/2,y+distY/2);
			draw_line(x,y,x+distX/2,randomY);
			draw_line(x+distX/2,randomY,inst.x,inst.y);
		}
	}
}