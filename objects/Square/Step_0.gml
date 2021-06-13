/// @description Movement

var k_move_up = Director.k_move_up // keyboard_check_pressed(ord("W"));
var k_move_down = Director.k_move_down // keyboard_check_pressed(ord("S"));
var k_move_right = Director.k_move_right // keyboard_check_pressed(ord("D"));
var k_move_left = Director.k_move_left // keyboard_check_pressed(ord("A"));
 
var k_cont_up    = Director.k_cont_up // keyboard_check_pressed(vk_up);
var k_cont_down  = Director.k_cont_down // keyboard_check_pressed(vk_down);
var k_cont_right = Director.k_cont_right // keyboard_check_pressed(vk_right);
var k_cont_left  = Director.k_cont_left // keyboard_check_pressed(vk_left);

var k_clock = Director.k_clock // keyboard_check_pressed(ord("E"));
var k_anti = Director.k_anti // keyboard_check_pressed(ord("Q"));

//Pit
if(!moving and !spin and !global.cont and place_meeting(x,y,Pit)){
	if(face != Face.falling){
		if(face==Face.happy){
			Square.face = Face.none;
		}
		fall_d = random(1)>.5 ? 1 : -1;
		face = Face.falling;
		Director.play_bad();
		for(var i=0;i<instance_number(Square);i++){
			var s = instance_find(Square,i);
			s.update_face();
		}
	}
	grav = approach(grav,1/650,1/45);
	image_angle+=grav*200*fall_d;
	image_xscale = approach(image_xscale,grav,0);
	image_yscale = approach(image_yscale,grav,0);
}



if(face==Face.sad || face == Face.falling){
	align_to_grid(F_SPD);
	exit;
}


if(face==Face.none and global.unaligned == 0){
	oh_face = false;
	align_to_grid(F_SPD);
	update_face();
}


var smile = face==Face.happy or face==Face.joy;

if(smile and !global.rotate and !spin){//WASD
	if(!moving){
		vx = k_move_right-k_move_left;
		vy = k_move_down-k_move_up;
		if( (vx!=0 xor vy!=0)){
			moving = true;
			global.unaligned++;
			alarm[0]=(F_SIZE div F_SPD)+1;
			Director.record_all(face);
		}
	}
	else{
		var squ = instance_place(x+vx*F_SPD,y+vy*F_SPD,Square)
		if(instance_exists(squ) && squ.face != Face.falling){
			var par = ds_list_create();
			if(!squ.collide_check(par)){
				x+=vx*F_SPD;
				y+=vy*F_SPD;
				//Director.play_good();
			}
			else{
				oh_face =true;
				//Director.play_cant();
			}
			ds_list_destroy(par);
		}
		else if(!place_meeting(x+vx*F_SPD,y+vy*F_SPD,parSolid)){
			x+=vx*F_SPD;
			y+=vy*F_SPD;
			//Director.play_good();
		}
		else{
			oh_face =true;
			//Director.play_cant();
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
			Director.record_all(Face.happy);
			face = Face.joy;
			n.face = Face.happy;
		}
		global.cont = true;
		alarm[1] = 1;
	}
}

if(face==Face.happy and global.unaligned==0 and !moving and !global.cont and !global.rotate and(k_clock xor k_anti)){
	global.rx = x; global.ry = y;
	global.r_failed = Director.rotate_collide(k_clock);
	global.rd = 0;//angle
	global.rs = 0;//speed
	global.rt = 0;//time
	global.rotate = true;
	global.rdir = k_clock ? -1: 1 ;
	if(!global.r_failed){
		Director.record_all(face);
		//Director.play_good();
	}
	else{
		oh_face =true;
		Director.play_cant();
	}
}

if(global.rotate and smile){
	if(!spin){
		global.unaligned++;
		spin = true;
	}
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
	if(spin){
		spin = false;
		oh_face =false;
		global.unaligned--;
	}
}
