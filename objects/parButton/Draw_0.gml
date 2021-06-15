/// @description Draw Text Button
var w =0, h=0;
var xoff = 28, yoff = 28;
var x1, x2, y1, y2;
var in = 7,fade = false;
draw_set_font(font);
draw_set_alpha(image_alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for(var i=0; i<instance_number(parButton); i++){
	var b = instance_find(parButton,i);
	w = max(w, string_width(b.text));
	h = max(h, string_height(b.text));
	x1 = b.x - xoff; y1 = b.y - yoff;
	x2 = x1+w+xoff; y2 = y1+h+yoff;
	fade = fade or position_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2);
}
x1 = x - xoff; x2 = 0; y1 = y - yoff; y2 = 0;
Editor.fade_in_b = fade or over;
x2 = x1+w+xoff; y2 = y1+h+yoff;

over = (over or !mouse_check_button(mb_left) ) and position_in_rectangle(mouse_x, mouse_y, x1, y1,x2,y2);

draw_set_color(c_black);
draw_roundrect(x1,y1,x2,y2,false);
var c = c_ltgray;
if(pressed){
	c = 0x584d47;
}
else if(over){
	c = c_gray;
}

draw_set_color(c);
draw_roundrect(x1+in,y1+in,x2-in,y2-in,false);
draw_set_color(c_black);
draw_text((x1+x2)/2,(y1+y2)/2,text);