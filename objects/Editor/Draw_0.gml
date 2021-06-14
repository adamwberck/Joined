/// @description Draw object
if(object!=noone){
	var inst = instance_create_depth(0,0,layer,object);
	inst.trigger_draw(mouse_x,mouse_y,rotate,.5);
	instance_destroy(inst);
}