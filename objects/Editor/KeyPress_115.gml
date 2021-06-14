/// @description Test current level

if(instance_exists(Director)){
	return_to_editor();
}
else{
	var lvl = parse_level();
	if(parse_string(lvl,false)){
		start_level(lvl);
	}
}