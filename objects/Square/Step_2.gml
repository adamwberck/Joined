/// @description For smoother movement
if(finish_move){
	while(!place_meeting(x+vx,y+vy,parSolid)){
		x+=vx;
		y+=vy;
	}
}

finish_move = false;