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
if(win){
	level_win();
}
	

k_reset = keyboard_check_pressed(ord("R"))
if(k_reset){
	//TODO reset FX
	room_restart();
}

k_undo = keyboard_check_pressed(ord("Z"));

if(k_undo){
	undo_all();
}