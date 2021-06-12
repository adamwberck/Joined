/// @description Change Face
switch(face){
	case Face.none:
		sprite_index = sSquare;
		break;
	case Face.sad:
		sprite_index = sSquare;
		break;
	case Face.joy:
	case Face.glad:
		sprite_index = sJoy;
		break;
	case Face.happy:
		sprite_index = sHappy;
		break;
}

draw_self();