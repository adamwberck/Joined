/// @description Change Face
sprite_index = face_sprite == sSleep2 ? sSleepSquare : sSquare2;
bob = (4*sin(frames/19.2));
draw_self();
var fx = lengthdir_x(bob,image_angle+90);
var fy = lengthdir_y(bob,image_angle+90);

face_trans();
var sub_image = face_sub;
if(!trans && blink<sprite_get_number(face_sprite)){
	blink++;
	sub_image = blink;
}

//normal draw

var o_sprite = face == Face.none || face == Face.sad ? noone : oh_face_check();
if(o_sprite == noone){
	draw_sprite_ext(face_sprite,sub_image,x+fx,y+fy,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}
else{
	draw_sprite_ext(o_sprite,oh_sub,x+fx,y+fy,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}

frames++;