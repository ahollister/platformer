// Check if there are jump frames left.
// Reduce the remaining jump frames and move player up.
function handle_jump_movement(_player) {
	if _player.jump_frames_remaining > 0 {
		_player.jump_frames_remaining--;
		_player.move_y = _player.jump_speed;
	}
}