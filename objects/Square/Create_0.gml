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
			break;
		case Face.happy:
			if(no_neighbors()){
				face = Face.sad;
			}
			break;
	}
	 ds_list_destroy(par);
}

function no_neighbors(){
	set_neighbors();
	for(var i=0;i<4;i++){
		if(neighbors[i]!=noone and neighbors[i].face != Face.falling){
			return false;
		}
	}
	return true;
}

function collide_check(par){
	ds_list_add(par,id)
	if(place_meeting(x+vx*F_SPD,y+vy*F_SPD,parSolid)){
		return true;
	}
	else{
		var squ = instance_place(x+vx*F_SPD,y+vy*F_SPD,Square)
		if(instance_exists(squ) and squ.face != Face.falling and !ds_list_contains(par,squ)){
			return squ.collide_check(par);
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
	ds_list_add(par,id)
	set_neighbors();
	for(var i=0;i<4;i++){
		var n = neighbors[i];
		if(!is_undefined(n) && !ds_list_contains(par,n)){
			if(instance_exists(n) && n.face == Face.happy){
				return true;
			}
			if(instance_exists(n) && n.face!=Face.falling && n.is_connected(par)){
				return true;
			}
		}
	}
	return false;
}


function align_to_grid(spd){
	if(face == Face.falling){
		return true;
	}
	var SIZE = F_SIZE
	var gx = calc_g(x,SIZE)
	var gy = calc_g(y,SIZE)
	var dir = point_direction(x,y,gx,gy);
	var len = point_distance(x,y,gx,gy);
	image_angle = round(image_angle/90)*90;
	if(len<=spd){
		x = gx; y = gy;
		return true;
	}
	else{
		jump_in_dir(spd,dir);
		return false;
	}
}

function calc_g(p,s){
	var r = p mod s;
	return r>s/2 ? p+s-r : p-r ;
}

rec[0][0] = noone;
function record(){
	rec[time][0] = x;
	rec[time][1] = y;
	rec[time][2] = face;
	rec[time][3] = image_angle;
	show_debug_message(image_angle);
	time++;
}

function undo(){
	if(time>0){
		time--;
		x    = rec[time][0]
		y    = rec[time][1];
		face = rec[time][2]
		image_angle = rec[time][3];
		if(face!=Face.falling){
			image_xscale = 1;
			image_yscale = 1;
			grav = 0;
		}
	}
}



face =  Face.none
align_to_grid(1000);
set_neighbors();