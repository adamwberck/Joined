/// @description Init Map and functions
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
ds_map_add(str_lay_map, "h", "Squares");
ds_map_add(str_lay_map, "p", "Wall");
ds_map_add(str_lay_map, "s", "Squares");
ds_map_add(str_lay_map, "w", "Wall");
ds_map_add(str_lay_map, "n", "");


function parse_level(){
	var level_string = "";
	for(var yy=64;yy<room_height;yy+=64){
		for(var xx=64;xx<room_width-64;xx+=64){
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

function start_level(level_string){
	resume_string = level_string;
	if( !instance_exists(Director) ){
		var director = instance_create_layer(0,0,"BehindWall",Director);
		director.cover_alpha =0;
	}
	instance_deactivate_object(parToolbar);
	var i=0;
	while(i<instance_number(parButton)){
		var p = instance_find(parButton,i);
		if(p.object_index != BackButton){
			instance_deactivate_object(p);
		}
		else{
			i++;
		}
	}
	instance_deactivate_object(parEd);
	instance_deactivate_object(edGrid);
	object = noone;
	global.ending = false;
}

function return_to_editor(){
	instance_destroy(Director);
	instance_destroy(parReal);
	instance_destroy(Text);
	var i=0;
	while(i<instance_number(parSolid)){
		var p = instance_find(parSolid,i);
		if(layer_get_name(p.layer) != "Border" ){
			instance_destroy(p);
		}
		else{
			i++;
		}
	}
	instance_activate_all();
	Editor.cover_alpha = 1;
	parse_string(resume_string,true);
}

function parse_string(input, ed){
	var str = decompress(input);
	var lst = ds_list_create();
	try{
		var i = 1;
		for(var yy=64;yy<room_height  ;yy+=64){
			for(var xx=64;xx<room_width-64;xx+=64){
				var let = string_char_at(str,i++);
				var obj =  ed ? str_ed_map[?let] : str_real_map[?let];
				var inst = instance_position(xx,yy,parEd);
				if(instance_exists(inst)){
					ds_list_add(lst,inst);
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
		while(ds_list_size(lst)>0){
			instance_destroy(ds_list_delete2(lst,0));
		}
		ds_list_destroy(lst);
		return true;
	}
	catch(error) {
		error = 0;
		ds_list_destroy(lst);
		return false;
	}
}