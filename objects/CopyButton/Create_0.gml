/// @description action
function action(){
	clipboard_set_text(Editor.parse_level());
	textinfo_create("Level Copied to Clipboard",c_white);
}