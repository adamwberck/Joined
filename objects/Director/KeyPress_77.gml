/// @description Toggle Music
if(audio_is_playing(Music)){
	audio_stop_sound(Music);
}
else{
	audio_play_sound(Music,2,true);
}
