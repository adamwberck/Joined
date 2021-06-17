/// @description adj 
var adj = array_create(8);
adj = gen_adjacent(object_index, adj);
var output = "";
for(var i = 0 ; i < 8; i++)
	output += string(adj[i]);
output = reverse_string(output)
show_debug_message(output);
clipboard_set_text(output);