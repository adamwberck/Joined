/// @description Check If Win
var square = instance_place(x,y,Square);
if(instance_exists(square) && !square.moving && !global.cont && !global.rotate){
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