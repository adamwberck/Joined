function decompress(str){
	var h_lst = ds_list_create();
	special_hex(h_lst);
	var p = "", de = "", hex = "";
	for(var i = 1; i < string_length(str) + 2; i++){
		var let = string_char_at(str,i);
		if(ds_list_contains(h_lst,let)){
			hex += let;
		}
		else if(hex != ""){
			var _real = hex_to_real(hex);
			repeat(_real-1){
				de += p;
			}
			hex = "";
			p = let;
			de += let;
		}
		else{
			p = let;
			de += let;
		}
	}
	ds_list_destroy(h_lst);
	return de;
}