function runtime_draw(){
	if( !is_undefined(sub) ){
		draw_sprite(sWall2,sub,x,y);
	}
	else{
		draw_self();
	}
}