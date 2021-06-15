/// @description Image Alpha
var goal_alpha = Editor.fade_in_b ? 1 : .2;
image_alpha = instance_exists(parToolbar) ? 0 : approach(image_alpha,.05,goal_alpha);