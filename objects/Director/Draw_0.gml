/// @description Draw Grid
draw_set_color(c_black);
draw_set_alpha(.2);
for(var i=-32;i<room_width;i+=64){
	for(var j=-32;j<room_height;j+=64){
		draw_roundrect(i+2,j+2,i+60,j+60,false);
	}
}

draw_set_color(c_white);
draw_set_alpha(1);