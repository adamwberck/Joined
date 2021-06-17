/// @description Delete

var xx = round(mouse_x/64)*64;
var yy = round(mouse_y/64)*64;
var inst = instance_position(xx,yy,parEd);
if(instance_exists(inst)){
	instance_destroy(inst);
}
