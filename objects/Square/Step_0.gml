/// @description Movement

k_move_up = keyboard_check_pressed(ord("W"));
k_move_down = keyboard_check_pressed(ord("S"));
k_move_right = keyboard_check_pressed(ord("D"));
k_move_left = keyboard_check_pressed(ord("A"));

var smile = face==Face.happy or face==Face.joy;
if(!moving){
	par = ds_list_create();
	switch(face){
		case Face.none:
			//check if connected
			if(is_connected(par)){
				face = Face.joy
			}
			break;
		case Face.sad:
			break;
		case Face.joy:
			if(!is_connected(par)){
				face = Face.none;
			}
		case Face.happy:
			break;
	}
	 ds_list_destroy(par);
}
if(smile){
	if(!moving){
		align_to_grid(F_SPD);
		vx = k_move_right-k_move_left;
		vy = k_move_down-k_move_up;
		if(vx!=0 xor vy!=0){
			moving = true;
			alarm[0]=(F_SIZE div F_SPD)+1;
		}
	}
	else{
		if(!place_meeting(x+vx*F_SPD,y+vy*F_SPD,parSolid)){
			x+=vx*F_SPD;
			y+=vy*F_SPD;
		}
		else{
			finish_move = true;
		}
	}
}