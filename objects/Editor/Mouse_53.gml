/// @description Create
if(object != noone and !fade_in){
	var xx = round(mouse_x/64)*64;
	var yy = round(mouse_y/64)*64;
	if(xx>32 and xx <room_width-32 and yy>32 and yy<room_height-32){
		var inst = instance_position(xx,yy,parEd);
		if(instance_exists(inst)){
			instance_destroy(inst);
		}
		var n = instance_create_layer(xx,yy,"Editor",object);
		if(object == edHap){
			n.destroy_happy();
		}
		n.image_angle = r_goal;
	}
}