if(destroy) instance_destroy();
destroyTimer--;
if(destroyTimer < 0) destroy = true;
image_xscale *= 1.05;
image_yscale *= 1.05;