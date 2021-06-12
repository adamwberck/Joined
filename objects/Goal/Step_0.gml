/// @description Check If Win
var square = instance_place(x,y,Square);
if(instance_exists(square) && !square.moving && !global.cont && !global.rotate){
	image_blend = c_lime;
	win = true;
}
else{
	image_blend = 0xFFFFFF00;
	win = false;
}