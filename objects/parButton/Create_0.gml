/// @description Define Func

function textinfo_create(str, color){
	instance_destroy(TextInfo);
	var t = instance_create_layer(room_width/2,room_height/2,"ToolBar",TextInfo);
	t._color = color;
	t.text = str;
}