/// @description draw text
image_alpha = approach(image_alpha,.05,alpha)
draw_set_alpha(image_alpha);
draw_set_font(font);
draw_set_color(c_dkgray);
var off = 3;
draw_roundrect(x-string_width(text)/2-off,y-string_height(text)/2-off,x+string_width(text)/2+off,y+string_height(text)/2+off,false);
draw_set_color(_color);
draw_set_halign(halign);
draw_text(x,y+y_off,text);

draw_set_color(c_white);
draw_set_alpha(1);

if(special){
	global.ending = true;
	if(keyboard_check_pressed(vk_anykey)){
		global.ending = false;
		instance_destroy();
	}
}
if(image_alpha==0){
	instance_destroy();
}