/// @description action
function action(){
	if(confirmed){
		var loaded = Editor.parse_string(clipboard_get_text(), true);
		confirmed = false;
		if(loaded){
			textinfo_create("Level Loaded from Clipborad", c_white);
		}
		else{
			textinfo_create("Could not Parse Level", c_red);
		}

	}
	else{
		confirmed = true;
		textinfo_create("Click Load again to load\n from Clipboard",c_white)
	}
}
