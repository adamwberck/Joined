/// @description action
event_inherited();

function action(){
	var lvl = Editor.parse_level();
	if(Editor.parse_string(lvl,false)){
		Editor.start_level(lvl);
	}
}
