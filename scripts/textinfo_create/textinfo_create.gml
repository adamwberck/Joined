// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function textinfo_create(str, color){
	instance_destroy(TextInfo);
	var t = instance_create_layer(room_width/2,room_height/2,"ToolBar",TextInfo);
	t._color = color;
	t.text = str;
}