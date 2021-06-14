/// @description set maps
tb_map = ds_map_create();
ds_map_add(tb_map, tbGoal,edGoal);
ds_map_add(tb_map, tbHap,edHap);
ds_map_add(tb_map, tbPit , edPit);
ds_map_add(tb_map, tbSquare , edSquare);
ds_map_add(tb_map, tbWall , edWall);

str_map = ds_map_create();
ds_map_add(str_map, edGoal,"g");
ds_map_add(str_map,	edHap,"h");
ds_map_add(str_map, edPit , "p");
ds_map_add(str_map, edSquare , "s");
ds_map_add(str_map, edWall , "w");
ds_map_add(str_map, noone , "n");

str_ed_map = ds_map_create();
ds_map_add(str_ed_map, "g", edGoal);
ds_map_add(str_ed_map, "h", edHap);
ds_map_add(str_ed_map, "p", edPit);
ds_map_add(str_ed_map, "s", edSquare);
ds_map_add(str_ed_map, "w", edWall);
ds_map_add(str_ed_map, "n", noone);

str_real_map = ds_map_create();

ds_map_add(str_real_map, "g", Goal);
ds_map_add(str_real_map, "h", Square);
ds_map_add(str_real_map, "p", Pit);
ds_map_add(str_real_map, "s", Square);
ds_map_add(str_real_map, "w", Wall);
ds_map_add(str_real_map, "n", noone);

str_lay_map = ds_map_create();

ds_map_add(str_lay_map, "g", "AboveWall");
ds_map_add(str_lay_map, "h", "Square");
ds_map_add(str_lay_map, "p", "Wall");
ds_map_add(str_lay_map, "s", "Square");
ds_map_add(str_lay_map, "w", "Wall");
ds_map_add(str_lay_map, "n", "");

function parse_level(){
	var level_string = "";
	for(var yy=0;yy<room_height-64;yy+=64){
		for(var xx=0;xx<room_width-64;xx+=64){
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
	return compress(level_string);
}

function parse_string(input, ed){
	var str = decompress(input);
	try{
		var i = 1;
		for(var yy=0;yy<room_height-64;yy+=64){
			for(var xx=0;xx<room_width-64;xx+=64){
				var let = string_char_at(str,i++);
				var obj =  ed ? str_ed_map[?let] : str_real_map[?let];
				var inst = instance_position(xx,yy,parEd);
				if(instance_exists(inst)){
					instance_destroy(inst)
				}
				if(obj!=noone){
					if(ed){
						var n = instance_create_layer(xx,yy,"Editor",obj);
						if(obj == edGoal or obj == edSquare or obj == edHap){
							n.image_angle = real(string_char_at(str,i++))*90;
						}
					}
					else{
						var lay = str_lay_map[?let];
						var n = instance_create_layer(xx,yy,lay,obj);
						if(obj == Goal or obj == Square){
							n.face = let=="h" ? Face.happy : Face.none;
							n.image_angle = real(string_char_at(str,i++))*90;
						}
					}
				}
			}
		}
		show_message("Level Loaded");
		return true;
	}
	catch(ignore) {
		show_message("Failed to Parse Clipboard Text");
		return false;
	}
}