/// @description Parse Clip to level
if(parse_string(clipboard_get_text(),false)){
	instance_activate_object(Director);
	instance_deactivate_object(parToolbar);
	instance_deactivate_object(parEd);
}