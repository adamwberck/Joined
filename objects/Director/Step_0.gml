/// @description Rotate
if(global.rotate){
	var a = .21;
	var _div = .33;
	global.rs = cos(a*global.rt-pi)/_div + 1/_div;
	global.rd = approach(global.rd,global.rs,90);
	global.rt++;
	if(global.rd >= 90){
		global.rotate = false;
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