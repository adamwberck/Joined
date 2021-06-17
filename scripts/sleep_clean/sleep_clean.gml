function sleep_clean(){
	part_type_destroy(part_sleep)
	part_emitter_destroy(sys_sleep, emit_sleep)
	part_system_destroy(sys_sleep)
}