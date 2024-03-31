function state_fall(_player) {
	// End any jumps.
	_player.jump_frames_remaining = 0;
	
	// Double jump.
	handle_double_jump(_player);
	
	// Otherwise Gravity will do the rest...
}