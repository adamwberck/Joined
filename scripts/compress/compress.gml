function compress(str){
	var h_lst = ds_list_create();
	special_hex(h_lst);
	var let = "";
	var com = "";
	var count = 0;
	for(var i=1;i<string_length(str)+1;i++){
		var same_letter = let==string_char_at(str,i) and count<15;
		if(same_letter){
			count++;
		}
		if(!same_letter or i==string_length(str)){
			if(count>1){
				com+=h_lst[|count]
			}
			if(!same_letter){
				let = string_char_at(str,i);
				com+=let;
				count = 1;
			}
		}
	}
	ds_list_destroy(h_lst);
	return com;
}