/// @description Trigger Draw
function trigger_draw(xx, yy, r){
	draw_sprite_ext(sSquare2    ,0,xx,yy,image_xscale,image_yscale,r,image_blend,image_alpha*.4);
	draw_sprite_ext(sprite_index,0,xx,yy,image_xscale,image_yscale,r,c_white,image_alpha*.4);
}