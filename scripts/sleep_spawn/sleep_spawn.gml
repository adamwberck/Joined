function sleep_spawn(xx, yy, dir){
	
	part_type_orientation(part_sleep, dir-20, dir+20, 0, 0, 0)
	part_type_direction(part_sleep, dir+90-20, dir+90+20, 0, 0)
	// To Use Particle:
	part_emitter_region(sys_sleep, emit_sleep, xx - 0, xx + 0, yy - 0, yy + 0, ps_shape_rectangle, ps_distr_linear)
	part_emitter_burst(sys_sleep, emit_sleep, part_sleep, 1)
}