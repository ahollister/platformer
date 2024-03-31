// JUMP state.
function state_jump(_player) {
	
	// Count the jump and reset the jump frames if jump is valid.
	if has_triggered_valid_jump(_player) {
		_player.jump_count++;
		_player.jump_frames_remaining = _player.jump_frames_max;
	}

	// Trigger FALL if jump key released.
	if input_check_released("accept") {
		_player.state = PLAYER_STATE.FALL;
	}

	// Handle upward movement of jump.
	handle_jump_movement(_player);
	
	// Trigger JUMPTOP state when player hits threshold.
	if _player.jump_frames_remaining = _player.jumptop_threshold {
		// Reset the remaining spin frames to max.
		_player.jumptop_frames_remaining = _player.jumptop_frames_max;
		
		_player.state = PLAYER_STATE.JUMPTOP;
	}
}