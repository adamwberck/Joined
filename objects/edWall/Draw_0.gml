/// @description Draw Tile
draw_self();
var sub = runtime_time_tile(map,object_index);
if( !is_undefined(sub) ){
	draw_sprite(sWall2,sub-1,x,y);
}