/// @description Fade out Cover
if(!instance_exists(Director)){
	var lay_id = layer_get_id("Cover");
	var back_id = layer_background_get_id(lay_id);
	cover_alpha = approach(cover_alpha,1/60,0);
	layer_background_alpha(back_id,cover_alpha)
	if(cover_alpha>=1){		
		if (room_exists(room_next(room)) ){
			room_goto_next();
		}
	}
}