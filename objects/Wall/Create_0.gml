/// @description Check Adj
function set_tile_sub(){
	sub = runtime_time_tile(Director.tile_map,object_index);
}

try{
	set_tile_sub();
}
catch(ignore){
	ignore = 0;
}