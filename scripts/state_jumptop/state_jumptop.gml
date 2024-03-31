// JUMPTOP state.
function state_jumptop(_player) {
	// Double jump if a valid one is triggered.
	handle_double_jump(_player);
	
	// Handle any ongoing jump movement.
	handle_jump_movement(_player);
	
	// Count the spin timer.
	_player.spin_frames_remaining--;
	
	// Jump and spin timers ended. Trigger Fall state.
	if _player.jump_frames_remaining = 0 && _player.spin_frames_remaining = 0 {
		_player.state = PLAYER_STATE.FALL
	}
}