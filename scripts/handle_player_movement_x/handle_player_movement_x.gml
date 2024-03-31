function handle_player_movement_x(_player) {
	// Either 1 or -1 (or 0 if both or neither are pressed).
	_move = 0
	if input_check("left") {
		_move -= 1
	}
	if input_check("right") {
		_move += 1
	}
	
	//_player.move_x = keyboard_check(vk_right) - input_check("left");
	
	// Make player move along X, multiplied by speed.
	_player.move_x = _move *_player.move_speed;

	// If player is moving on X axis.
	if (_player.move_x != 0 ) {
		// Set direction of sprite image based on direction.
		image_xscale = sign(_player.move_x);
	}
}