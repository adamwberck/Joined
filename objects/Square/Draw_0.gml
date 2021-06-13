/// @description Change Face
var face_sprite;
sprite_index = face == Face.none ? sSleepSquare : sSquare2;
switch(face){
	case Face.none:
		face_sprite = sSleep2;
		break;
	case Face.sad:
	case Face.falling:
		face_sprite = sSad2;
		break;
	case Face.joy:
		face_sprite = sJoy2;
		break;
	case Face.happy:
		face_sprite = sHap2;
		break;
}
bob = (4*sin(frames/19.2));
draw_self();
var fx = lengthdir_x(bob,image_angle+90);
var fy = lengthdir_y(bob,image_angle+90);

var sub_image = 0;
if(blink<sprite_get_number(face_sprite)){
	blink++;
	sub_image = blink;
}
draw_sprite_ext(face_sprite,sub_image,x+fx,y+fy,1,1,image_angle,image_blend,image_alpha);
frames++;