function ds_list_delete2(id,pos){
	var value = id[|pos];
	ds_list_delete(id,pos);
	return value;
}