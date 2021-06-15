/// @description Toggle Music
if(!instance_exists(Director)){
	if(audio_is_playing(Music)){
		audio_stop_sound(Music);
	}
	else{
		audio_play_sound(Music,2,true);
	}
}