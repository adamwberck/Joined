/// @description Try to Spin
if pause_check(true) then exit;

mInProgress = mSpin || mDrawCut;

if(Director.guiLevel>=5 && Director.mIsRunning && emergency_check && !mSpin && !mDrawCut){
	alarm[1] = 20*room_speed;
	emergency_check = false;
	
	var e_list = ds_list_create();
	var emergency = false;
	for(var i=0;i<instance_number(Card);i++){
		var card = instance_find(Card,i);
		var mover = card.mMover;
		if(!ds_list_contains(e_list,mover)){
			ds_list_add(e_list,mover);
		}else{
			qdbug("EMERGENCY");
			emergency = true;
			break;
		}
	}
	if(emergency){
		for(var i=0;i<instance_number(Card);i++){
			var card = instance_find(Card,i);
			card.mMover = instance_find(CardMover,i);
		}
	}
	ds_list_destroy(e_list);
}


if(!mDrawCut && !mSpin && !mWaiting && Director.guiLevel>=5 && Director.mIsRunning && Director.guiLevel==Director.mLevel &&MoveDirector.t_shrink>=1.00){
	var level = Director.mLevel-5;
	alarm[0] = 25*(11-level)+30;
	mWaiting = true;
	event_user(0);
}else if(mDrawCut || mSpin){
	alarm[0]++;
}