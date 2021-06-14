/// @description Draw Grid and object
draw_set_color(c_black);
draw_set_alpha(.2);
for(var i=-32;i<room_width;i+=64){
	for(var j=-32;j<room_height;j+=64){
		draw_roundrect(i+2,j+2,i+60,j+60,false);
	}
}

draw_set_color(c_white);
draw_set_alpha(1);

if(object!=noone){
	//var sp = object_get_sprite(object);
	var inst = instance_create_depth(0,0,layer,object);
	inst.trigger_draw(mouse_x,mouse_y,rotate);
	instance_destroy(inst);
}