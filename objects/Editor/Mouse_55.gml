/// @description Debug Press
try{
	show_debug_message(layer_get_name(instance_position(mouse_x,mouse_y,all).layer));
}
catch(e){
	show_debug_message(e);
}