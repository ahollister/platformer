function apply_gravity(_player) {
	_player.move_y += _player.fall_gravity;
	
	if (_player.move_y > _player.terminal_velocity) {
		_player.move_y = _player.terminal_velocity;
	}
}