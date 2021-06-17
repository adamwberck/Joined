/// @description Trigger Draw
function trigger_draw(xx, yy, r,a ){
	draw_sprite_ext(sprite_index,0,xx,yy,image_xscale,image_yscale,r,c_white,a);
}

map = ds_map_create();
gen_runtime_map(map)