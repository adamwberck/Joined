for(var i=0;i<10;i++){
	if(keyboard_check_pressed(ord(string(i)))){
		var d = keyboard_check(vk_shift) ? -1 : 1;
		value[i] = value[i] + d;
	}
}