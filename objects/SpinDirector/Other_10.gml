/// @description Detect Cards
if(!mSpin && !mDrawCut){
	var level = Director.mLevel;
	var a,b,c;
	if(level<15){
		a=2;b=3;c=3;
	}
	else if(level<18){
		a=2;b=3;c=4;
	}
	else if(level<21){
		a=3;b=3;c=4;
	}
	else{
		a=3;b=4;c=4;
	}
	
	mLength = choose(2,2,2,a,b,c);
	var len  = mLength;var size = sqr(len);
	
	var r = irandom(sqr(6-len)-1);
	var inc = len-1;
	for(var q=5;q<16;q+=5){
		if(r>q-len)  then r+=inc; else break;
	}

	//get the cards
	var cards,x_av=0,y_av=0;
	for(var i=0;i<size;i++){
		var m = instance_find(CardMover,r),c;
		with(m)	{c=instance_nearest(x,y,Card)}
		cards[i] = c;
		c.mAttached = false;c.mAlmostAttached=false;
		if(i%len==len-1) then r+=6-len else r++;
		x_av+=c.x; y_av+=c.y;
	}
	x=x_av/size;y=y_av/size;
	
	//put the cards in 2d array
	var k=0;
	for(var i=0;i<len;i++){
		for(var j=0;j<len;j++){
			mCards[i,j]=cards[k++];
		}
	}
	
	//lets spin
	mRotateDir = choose(-1,1);
	mRotateGoal = 90;
	mFirst = irandom(3);
	mDrawCut=true;
	mMover = instance_create_fx(x,y,CardMover);
}