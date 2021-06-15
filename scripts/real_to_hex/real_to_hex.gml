function real_to_hex(_real){
	var h_lst = ds_list_create();
	special_hex(h_lst);
	var str = ""
	while(_real>0){
		var r = _real mod 16;
		_real = _real div 16;
		str += h_lst[|r];
	}
	ds_list_destroy(h_lst);
	return str;
}