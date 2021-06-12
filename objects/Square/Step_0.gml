/// @description Movement

k_move_up = keyboard_check_pressed(ord("W"));
k_move_down = keyboard_check_pressed(ord("S"));
k_move_right = keyboard_check_pressed(ord("D"));
k_move_left = keyboard_check_pressed(ord("A"));

k_cont_up = keyboard_check_pressed(vk_up);
k_cont_down = keyboard_check_pressed(vk_down);
k_cont_right = keyboard_check_pressed(vk_right);
k_cont_left = keyboard_check_pressed(vk_left);

if(face==Face.none){
	update_face();
}

var smile = face==Face.happy or face==Face.joy;

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
		var squ = instance_place(x+vx*F_SPD,y+vy*F_SPD,Square)
		if(instance_exists(squ)){
			if(!squ.collide_check()){
				x+=vx*F_SPD;
				y+=vy*F_SPD;
			}
		}
		else if(!place_meeting(x+vx*F_SPD,y+vy*F_SPD,parSolid)){
			x+=vx*F_SPD;
			y+=vy*F_SPD;
		}
	}
}
	
	
if(!global.cont && face==Face.happy){
	cx = k_cont_right-k_cont_left;
	cy = k_cont_down-k_cont_up;
	if(cx!=0 xor cy!=0){
		set_neighbors();
		var n = new_happy();
		if(instance_exists(n)){
			face = Face.joy;
			n.face = Face.happy;
		}
	}
	global.cont = true;
	alarm[1] = 1;
}
