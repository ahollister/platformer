// Allow character to transition to JUMP state if there are more jumps available.
// Used in certain states to transition back to JUMP for double jumping.
function handle_double_jump(_player) {
	
	// Count the jump and reset the jump frames if jump is valid.
	if has_triggered_valid_jump(_player) {
		_player.jump_count++;
		_player.jump_frames_remaining = _player.jump_frames_max;
		// Trigger JUMP state.
		_player.state = PLAYER_STATE.JUMP;
	}
}