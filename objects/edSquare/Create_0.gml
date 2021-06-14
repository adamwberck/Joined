/// @description Trigger Draw
function trigger_draw(xx, yy, r){
	draw_sprite_ext(sprite_index, 0, xx, yy, 1, 1, r, image_blend, image_alpha);
	draw_sprite_ext(sSleep2,0,xx,yy,1,1,r,c_white,image_alpha);
}