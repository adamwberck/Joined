/// @description Rotate
if(global.rotate){
	var a = .21;
	var _div = .33;
	global.rs = cos(a*global.rt-pi)/_div + 1/_div;
	global.rd = approach(global.rd,global.rs,90);
	global.rt++;
	if(global.rd >= 90){
		if(!global.r_failed){
			global.rotate = false;
		}else{//rotate back
			global.rd = 0;
			global.rdir = -global.rdir;
			global.rt=0;
			global.r_failed = false;
		}
	}
}
var win = true;
for(var i=0;i<instance_number(Goal);i++){
	var g = instance_find(Goal,i);
	if(!g.win){
		win  = false;
		break;
	}
}
if(win and instance_number(Goal)>0){
	level_win();
}
	

k_reset = keyboard_check_pressed(ord("R"))
if(k_reset){
	//TODO reset FX
	room_restart();
}

k_undo = keyboard_check_pressed(ord("Z"));

if(k_undo && global.unaligned ==0){
	undo_all();
}

if(global.ending){
	var lay_id = layer_get_id("Cover");
	var back_id = layer_background_get_id(lay_id);
	cover_alpha = approach(cover_alpha,1/60,1);
	layer_background_alpha(back_id,cover_alpha)
	var text = instance_find(Text,1);
	if(cover_alpha>=1 &&( !instance_exists(text) or !text.special) ){		
		if (room_exists(room_next(room))){
			room_goto_next();
		}
		else{
			game_restart();
		}
	}
}
else{
	var lay_id = layer_get_id("Cover");
	var back_id = layer_background_get_id(lay_id);
	cover_alpha = approach(cover_alpha,1/60,0);
	layer_background_alpha(back_id,cover_alpha)
	if(cover_alpha>=1){		
		if (room_exists(room_next(room))){
			room_goto_next();
		}
	}
}