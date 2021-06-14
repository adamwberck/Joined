/// @description Parse String
var str = decompress(clipboard_get_text());
try{
	var i = 1;
	var ed = true;
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
}
catch (_exception ){
	show_message("Failed to Parse Clipboard Text");
}