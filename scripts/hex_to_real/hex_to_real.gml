function hex_to_real(hex){
	var lst = ds_list_create();
	special_hex(lst);
	var total = 0;
	for(var i=1; i<string_length(hex)+1; i++){
		var d = string_char_at(hex,i);
		var r = ds_list_find_index(lst,d);
		var e = i-1;
		total += r*power(16,e);
	}
	ds_list_destroy(lst);
	return total;
}