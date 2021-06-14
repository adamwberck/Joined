/// @description Rotate
var dd = angle_difference(rotate, r_goal);
rotate -= min(abs(dd), 90/15) * sign(dd);

rotate = (rotate + 360) mod 360 