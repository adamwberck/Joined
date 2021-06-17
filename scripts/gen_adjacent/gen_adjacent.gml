function gen_adjacent(obj, adj){
	var i=0;
	for (var dx = -1; dx <= 1; ++dx) {
	    for (var dy = -1; dy <= 1; ++dy) {
	        if (dx != 0 || dy != 0) {
				adj[i++] = position_meeting(x + dx * 64, y + dy * 64, obj) ? 1 : 0;
	        }
	    }
	}
	return adj;
}