/// @description Init Values and Define Functions

neighbors = array_create(4,noone);//left right up down


function new_happy(){
	var i = ceil(cx/2)+ceil(cy/2)+2*abs(cy);
	return neighbors[i];
}

function update_face(){
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


function collide_check(){
	if(place_meeting(x+vx*F_SPD,y+vy*F_SPD,parSolid)){
		return true;
	}
	else{
		var squ = instance_place(x+vx*F_SPD,y+vy*F_SPD,Square)
		if(instance_exists(squ)){
			return squ.collide_check();
		}
		return false;
	}
}

function set_neighbors(){
	for(var i=0;i<4;i++){
		var s = 1//(F_SIZE div 2);
		var xx = i<2 ?  2*i-1 : 0;
		var yy = i>1 ?  2*i-5 : 0;
		var inst = instance_place(x+xx*s,y+yy*s,Square);
		neighbors[i] = inst;
	}
}

function is_connected(par){
	show_debug_message("checking "+string(id))
	ds_list_add(par,id)
	set_neighbors();
	for(var i=0;i<4;i++){
		var n = neighbors[i];
		if(!is_undefined(n) && !ds_list_contains(par,n)){
			if(instance_exists(n) && n.face == Face.happy){
				return true;
			}
			if(instance_exists(n) && n.is_connected(par)){
				return true;
			}
		}
	}
	return false;
}


function align_to_grid(spd){
	var SIZE = F_SIZE
	var gx = calc_g(x,SIZE)
	var gy = calc_g(y,SIZE)
	var dir = point_direction(x,y,gx,gy);
	var len = min(point_distance(x,y,gx,gy),spd);
	jump_in_dir(len,dir);
	return len==0;
}

function calc_g(p,s){
	var r = p mod s;
	return r>s/2 ? p+s-r : p-r ;
}


face =  Face.none
align_to_grid(1000);
set_neighbors();