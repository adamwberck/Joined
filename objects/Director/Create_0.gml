/// @description Init Game
enum Face{
	none,
	happy,
	sad,
	joy,
	falling
}

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


global.cont = false;
global.rotate = false;
global.r_failed = false;
global.rd = 0;
global.unaligned = 0;
global.ending = false;

good_sound = ds_list_create();
bad_sound = ds_list_create();
cant_sound = ds_list_create();
ds_list_add(bad_sound,aaaw);
ds_list_add(bad_sound,aaay);
ds_list_add(bad_sound,ah_man);
ds_list_add(good_sound,deeeh);
ds_list_add(good_sound,eeeh);
ds_list_add(good_sound,eeem);
ds_list_add(cant_sound,no);
ds_list_add(cant_sound,oh);
ds_list_add(cant_sound,oooo);

randomize();

function play_bad(){
	audio_play_sound(Director.bad_sound[|irandom(ds_list_size(Director.bad_sound)-1)],1,false);
}

function play_good(){
	audio_play_sound(Director.good_sound[|irandom(ds_list_size(Director.good_sound)-1)],1,false);
}

function play_cant(){
	audio_play_sound(Director.cant_sound[|irandom(ds_list_size(Director.cant_sound)-1)],1,false);
}


function play_cant(){
	audio_play_sound(
			Director.cant_sound[|irandom(ds_list_size(Director.cant_sound)-1)],1,false);
}


function rotate_collide(dir){
	var angle = dir ? -90 : 90;
	var flag = false;
	for(var i=0;i<instance_number(Square);i++){
		var s = instance_find(Square,i);
		if(s.face == Face.happy || s.face == Face.joy){
			var t_matrix = gen_2x2_array(dcos(angle),dsin(angle),//i hat
				dcos(90 + angle),dsin(90 + angle));//j hat
			cords = [s.x-global.rx,s.y-global.ry];
			v = vector_product(t_matrix,cords)
			var xx = v[0]+global.rx, yy = v[1]+global.ry;
			instance_create_layer(xx,yy,"AboveWall",RedGlow);
			with(s){
				var s2 = instance_place(xx,yy,Square);
				var sqrcol = instance_exists(s2) && s2.face == Face.none;
				var solcol = place_meeting(xx,yy,parSolid);	
				if(sqrcol || solcol){
					flag = true;//collision
				}
			}
		}
	}
	if(!flag){
		RedGlow.image_alpha = 0;
		instance_destroy(RedGlow);
	}
	return flag;
}

function level_win(){
	//show text
	if(!instance_exists(any_key)){
		any_key = instance_create_layer(room_width/2,room_height/2,"AboveWall",AnyKeyToContinue);
		play_good();

	}
	if(keyboard_check_pressed(vk_anykey)){
		global.ending = true;
	}
}
	
function record_all(face){
	if(face == Face.happy){
		for(var i=0;i<instance_number(Square);i++){
			var s = instance_find(Square,i);
			s.record();
		}
	}
}

function undo_all(){
	for(var i=0;i<instance_number(Square);i++){
		var s = instance_find(Square,i);
		s.undo();
	}
}
