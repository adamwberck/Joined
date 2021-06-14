function decompress(str){
	var h_lst = ds_list_create();
	special_hex(h_lst);
	var p = "";
	var de = "";
	for(var i=1;i<string_length(str)+1;i++){
		var let = string_char_at(str,i);
		if(ds_list_contains(h_lst,let)){
			var r = ds_list_find_index(h_lst,let);
			repeat(r-1){
				de+=p;
			}
		}
		else{
			p = let;
			de += let;
		}
	}
	instance_destroy(h_lst);
	return de;
}