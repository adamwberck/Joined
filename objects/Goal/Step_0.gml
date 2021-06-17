/// @description Check If Win
//image_angle = round(direction/90)*90;

var square = instance_place(x,y,Square);
var smile = instance_exists(square) and (square.face == Face.happy or square.face == Face.joy);
if(smile and !square.moving and !global.cont and !global.rotate){
	if((image_angle+360*100) mod 360 == (square.image_angle+360*100) mod 360){
		image_blend = c_lime;
		win = true;
	}
	else{
		image_blend = c_purple;
		win = false;
	}
}
else{
	image_blend = 0xFFFFFF00;
	win = false;
}
if(square==noone){
	col = noone;
}