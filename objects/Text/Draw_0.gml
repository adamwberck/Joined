/// @description draw text 

var y_off = 20*sin(time++/30);
draw_set_font(font);
draw_set_alpha(.8);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(x,y+y_off,text);
//draw_set_color(c_black);
//draw_text(x-2,y+y_off-2,text);

draw_set_color(c_white);
draw_set_alpha(1);

if(special){
	global.ending = true;
	if(keyboard_check_pressed(vk_anykey)){
		global.ending = false;
		instance_destroy();
	}
}