if(drawValues){
	for(var i=1; i<11;i++){
		var i2 = i mod 10;
		draw_set_font(devil);
		draw_set_alpha(1);
		draw_set_color(c_lime);
		draw_text(x,y+i*40,string(i2)+" "+string(value[i2]));
	}
}