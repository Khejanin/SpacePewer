collision = false;
if(obj_Player.gamepad) showDesc = false;
if(resizeAllowed){
	if(shrink){
		image_xscale *= 0.995;
		image_yscale *= 0.995;
	}
	else{
		image_xscale *= 1.005;
		image_yscale *= 1.005;
	}

	sizetimer--;
	if(sizetimer <= 0){
		sizetimer = 50;
		if(shrink) shrink = false;
		else shrink = true;
	}
}