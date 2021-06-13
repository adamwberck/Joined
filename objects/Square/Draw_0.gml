/// @description Change Face
switch(face){
	case Face.none:
		sprite_index = sSleep;
		break;
	case Face.sad:
		sprite_index = sSad;
		break;
	case Face.joy:
		sprite_index = sJoy;
		break;
	case Face.happy:
		sprite_index = sHappy;
		break;
}

draw_self();