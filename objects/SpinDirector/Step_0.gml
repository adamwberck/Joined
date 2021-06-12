/// @description Spin
if pause_check(false) then exit;

var len = mLength;
var size = sqr(len);
if(mSpin){
	var goalDir =  mTotalRoated < mRotateGoal/2  ? 1 : -1;//speed up or slow down
	rSpd +=(rAccel/(pi*mLength))*goalDir;
	var clampedSpd =  clamp(rSpd,.5,rSpdMax/(pi*mLength));
	
	//shrink
	var shrink = mTotalRoated % 90  < 45 ? mShrink: 2-mShrink;//shrink if near a 45 angle
	mTotalShrink*= shrink;
	var hsqrt2 = .5*sqrt(2);
	var clamped_shrink = clamp(mTotalShrink,hsqrt2,1);//clamp the shrink
	if(clamped_shrink==1 || clamped_shrink==hsqrt2) {//change the rate
		shrink=1;
	}
	var t_matrix = gen_2x2_array(dcos(mRotateDir*clampedSpd)*shrink,dsin(mRotateDir*clampedSpd)*shrink,//i hat
		dcos(90 + mRotateDir*clampedSpd)*shrink,dsin(90 + mRotateDir*clampedSpd)*shrink);//j hat*/
	mBoardAngle += mRotateDir*clampedSpd;
	mTotalRoated += clampedSpd;//approach(mTotalRoated,rSpd,mRotateGoal-.001);//track rotation
	if (mBoardAngle<0) then mBoardAngle=360-mBoardAngle;
	var x_av=0,y_av=0;
	for(var i=0;i<len;i++){
		for(var j=0;j<len;j++){
			var card = mCards[i,j];
			card.mScale = clamped_shrink;
			x_av+=card.x; y_av+=card.y;
	
			//transform board
			card.image_angle = mBoardAngle; // change angle
			var tx = card.x-x; var ty = card.y-y;
			var vector0; vector0[0]=tx; vector0[1]=ty;
			var vector1 = vector_product(t_matrix,vector0);
			card.x=vector1[0]+x;
			card.y=vector1[1]+y;
		}
	}
	x = x_av/size;y = y_av/size;
}


if(mTotalRoated >= mRotateGoal){
	instance_destroy(mMover);
	mDrawCut = false;mCutPercent=0;
	mSpin=false; mBoardAngle=0;rSpd=.5;mTotalRoated=0;mTotalShrink=1;
	for(var i=0;i<len;i++){
		for(var j=0;j<len;j++){
			var card = mCards[i,j];
			if(card.mForm == enumForm.flip_help || card.mForm == enumForm.flip_hidden){
				card.mResetAngle  = true;
			}
			else{
				card.image_angle = 0;
			}
			card.mScale = 1;
			card.mMover = instance_nearest(card.x,card.y,CardMover);
			card.mAlmostAttached = true;
		}
	}
}