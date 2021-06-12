/// @description Init Game
enum Face{
	none,
	happy,
	sad,
	joy
}

global.cont = false;
global.rotate = false;
global.rd = 0;
global.unaligned = 0;

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
	//TODO level win
	if (room_exists(room_next(room)))
    {
		room_goto_next();
    }
}