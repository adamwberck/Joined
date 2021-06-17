function runtime_time_tile(adj_map,obj){
	var adj_wall = array_create(8,false);//lt, l, lb, t, b, rt, r, rb

	adj_wall = gen_adjacent(obj,adj_wall);
	//converting to binary
	var b = 0;
	for(var i = 0; i < 8; i++){
		b += adj_wall[i]*power(2,i);
	}
	return adj_map[?b]-1;
}