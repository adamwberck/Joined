/// @description Parse Level
for(var yy=32;yy<room_height-64;yy+=64){
	for(var xx=32;xx<room_width-64;xx+=64){
		var inst = instance_position(xx,yy,parEd);
		if(instance_exists(inst)){
			level_string = level_string + str_map[?inst.object_index];
		
			if(inst.object_index == edGoal or inst.object_index == edSquare
				or inst.object_index == edHap){
				level_string = level_string + string( (inst.image_angle mod 360) div 90);
			}
		}
		else{
			level_string = level_string + str_map[?noone];
		}
	}
}

show_debug_message(level_string);
level_string = "";
