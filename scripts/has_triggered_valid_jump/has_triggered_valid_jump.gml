function has_triggered_valid_jump(_player) {
	return input_check_pressed("accept") && _player.jump_count < _player.jump_max
}