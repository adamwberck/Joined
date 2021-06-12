/// @description Draw Cut

if(mSpin || mDrawCut){
	var adjarr;
	adjarr = [.5,.8,1.05];
	var adj = adjarr[mLength-2];
	var len = clamp(mTotalShrink,1,1)*268*(mLength-adj);
	var r1,r2,r3,r4
	
	var oldAngle = mBoardAngle;
	mBoardAngle=0;
	r1[0] = mMover.x + lengthdir_x(len,mBoardAngle+135);r1[1] = mMover.y + lengthdir_y(len,mBoardAngle+135);
	r2[0] = mMover.x + lengthdir_x(len,mBoardAngle+45);r2[1] = mMover.y + lengthdir_y(len,mBoardAngle+45);
	r3[0] = mMover.x + lengthdir_x(len,mBoardAngle+225);r3[1] = mMover.y + lengthdir_y(len,mBoardAngle+225);
	r4[0] = mMover.x + lengthdir_x(len,mBoardAngle+315);r4[1] = mMover.y + lengthdir_y(len,mBoardAngle+315);
	
	
	mBoardAngle = oldAngle;
	var d = mLength==3? 1.08 : 1.095;
	var b = mLength*d;
	var s = clamp(mTotalShrink,0,1)*b;
	var showColor = Director.mScolors[Director.guiLevel];
	draw_sprite_ext(sSquare,0,mMover.x,mMover.y,b,b,		  0,showColor,1);
	draw_sprite_ext(sSquare,0,mMover.x,mMover.y,s,s,mBoardAngle,Director.mBackgroundBlend,1);
	
	
	var cmap = ds_map_create();
	ds_map_add(cmap,r1,r2);
	ds_map_add(cmap,r2,r4);
	ds_map_add(cmap,r4,r3);
	ds_map_add(cmap,r3,r1);
	var ccmap = ds_map_create();
	ds_map_add(ccmap,r1,r3);
	ds_map_add(ccmap,r3,r4);
	ds_map_add(ccmap,r4,r2);
	ds_map_add(ccmap,r2,r1);
	
	var map = mRotateDir==1 ? ccmap : cmap ,first,next;
	switch(mFirst){ 
		case 0:
			first = r1;
		case 1:
			first = r2;
		case 2:
			first = r3;
		case 3:
			first = r4;
	}
	next = map[?first];
	for(var i=0;i<4;i++){
		draw_set_color(showColor);
		draw_cut_line(first,next,0.25*i+.25);
		first = next;
		next = map[?first];
	}
	ds_map_destroy(cmap);ds_map_destroy(ccmap);
	
	var level = min(Director.mLevel-5,6);
	var slow = (level+1)/5.5;
	var adjust =(.02/mLength)*slow;
	var len = max(abs(first[0]-next[0]),abs(first[1]-next[1]));
	var lperframe = (adjust/.25*len);
	
	var millisecs = ((175/lperframe)/60)*1000;
	if !pause_check(false) then mCutPercent = approach(mCutPercent,adjust,1);
	//Audio
	if pause_check(false) then exit;
	if(mDrawCut){
		var rcard = mCards[irandom(mLength-1),irandom(mLength-1)];
		var newAudio = MusicDirector.map_audio_strings[?rcard.mAudioIndex];
	
		if(audio_is_playing(mStringPlayIndex)){//check to see if needed to stop
			if(audio_sound_get_gain(mStringPlayIndex)<=0){
				audio_stop_sound(mStringPlayIndex);
			}
		}
		if(!audio_is_playing(mStringPlayIndex)){
			mStringPlayIndex = audio_play_sound(newAudio ,50,false);
			audio_sound_gain(mStringPlayIndex,1,0);
			audio_sound_gain(mStringPlayIndex,0,millisecs);
		}
	}
	
	if(mCutPercent==1){
		mDrawCut = false;
		mSpin = true;
	}
}







/*
var len = mLength;
if(mSpin){
	for(var i=0;i<len;i++){
		for(var j=0;j<len;j++){
			var c = mCards[i,j];
			//draw_set_color(c_fuchsia);
			//draw_set_font(DebugFont);
			//draw_text(c.x,c.y,i)
			draw_sprite(sDot,0,c.x,c.y);
		}
	}
	draw_arrow(x,y,x+dcos(mBoardAngle)*150,y-dsin(mBoardAngle)*150,100);
}
draw_self();