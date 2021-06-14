/// @description Trigger Draw
function trigger_draw(xx, yy, r,a){
	draw_sprite_ext(sprite_index, 0, xx, yy, 1, 1, r, image_blend, a);
	draw_sprite_ext(sSleep2,0,xx,yy,1,1,r,c_white,a*4);
}