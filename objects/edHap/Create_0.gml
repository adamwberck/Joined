/// @description delete other happy and Trigger Draw
function trigger_draw(xx, yy, r, a){
	draw_sprite_ext(sprite_index, 0, xx, yy, 1, 1, r, image_blend, a);
	draw_sprite_ext(sHap2, 0, xx, yy, 1, 1, r, c_white, a);
}

function destroy_happy(){
	for(var i=0;i<instance_number(edHap);i++){
		var hap = instance_find(edHap,i);
		if(hap != id){
			var s = instance_create_depth(hap.x,hap.y,hap.layer,edSquare);
			s.image_angle = hap.image_angle;
			instance_destroy(hap);
		}
	}
}
