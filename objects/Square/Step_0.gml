/// @description Movement

k_move_up = keyboard_check_pressed(ord("W"));
k_move_down = keyboard_check_pressed(ord("S"));
k_move_right = keyboard_check_pressed(ord("D"));
k_move_left = keyboard_check_pressed(ord("A"));

k_cont_up = keyboard_check_pressed(vk_up);
k_cont_down = keyboard_check_pressed(vk_down);
k_cont_right = keyboard_check_pressed(vk_right);
k_cont_left = keyboard_check_pressed(vk_left);

k_clock = keyboard_check_pressed(ord("E"));
k_anti = keyboard_check_pressed(ord("Q"));

if(face==Face.none && !global.rotate){
	align_to_grid(F_SPD);
	update_face();
}

var smile = face==Face.happy or face==Face.joy;

if(smile and !global.rotate){//WASD
	if(!moving){
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
			var par = ds_list_create();
			if(!squ.collide_check(par)){
				x+=vx*F_SPD;
				y+=vy*F_SPD;
			}
			ds_list_destroy(par);
		}
		else if(!place_meeting(x+vx*F_SPD,y+vy*F_SPD,parSolid)){
			x+=vx*F_SPD;
			y+=vy*F_SPD;
		}
	}
}
	
	
if(!global.cont && face==Face.happy && !global.rotate){//ARROW KEYS
	cx = k_cont_right-k_cont_left;
	cy = k_cont_down-k_cont_up;
	if(cx!=0 xor cy!=0){
		set_neighbors();
		var n = new_happy();
		if(instance_exists(n)){
			face = Face.joy;
			n.face = Face.happy;
		}
		global.cont = true;
		alarm[1] = 1;
	}
}

if(face==Face.happy and !moving and !global.cont and !global.rotate and(k_clock xor k_anti)){
	global.rx = x; global.ry = y;
	if(!Director.rotate_collide(k_clock)){
		global.rd = 0;//angle
		global.rs = 0;//speed
		global.rt = 0;//time
		global.rotate = true;
		global.rdir = k_clock ? -1: 1 ;
	}
}

if(global.rotate and smile){
	var _rs = global.rs*global.rdir;
	var t_matrix = gen_2x2_array(dcos(_rs),dsin(_rs),//i hat
		dcos(90 + _rs),dsin(90 + _rs));//j hat*/
	cords = [x-global.rx,y-global.ry];
	v = vector_product(t_matrix,cords)
	x = v[0]+global.rx; y = v[1]+global.ry;
	image_angle += _rs;
}

if(!global.rotate and !moving){
	align_to_grid(F_SPD);
}