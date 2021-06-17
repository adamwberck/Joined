function sleep_setup(){
	// Setup:
	sys_sleep = part_system_create()
	part_system_layer(sys_sleep, layer_get_id("AboveWall"))
	part_sleep = part_type_create()
	part_type_sprite(part_sleep, sZ, 0, false, 0)
	part_type_size(part_sleep, 0.2, 0.35, -0.001, 0)
	part_type_scale(part_sleep, 1, 1)
	part_type_color1(part_sleep, c_black)
	part_type_alpha2(part_sleep, 1,  0)
	part_type_speed(part_sleep, 0.40, 1, 0.01, 0)
	part_type_gravity(part_sleep, 0, 90)
	part_type_blend(part_sleep, 0)
	part_type_life(part_sleep, 60, 75)
	emit_sleep = part_emitter_create(sys_sleep)

	// Particle Designer Stuff (Unnecessary elsewhere)
	/*
	Position: 1
	Frequency: 50
	Number: 1
	Sprite File Name: spr_sleep.png
	Sprite Images: 1*/

}