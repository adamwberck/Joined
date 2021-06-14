/// @description Play Clipboard Level 

//Todo remove

if(instance_exists(Director)){
	return_to_editor();
}
else{
	var lvl = clipboard_get_text()
	if(parse_string(lvl,false)){
		start_level(lvl);
	}
}