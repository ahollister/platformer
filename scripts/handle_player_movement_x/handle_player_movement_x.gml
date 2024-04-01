/// @handle_player_movement_x(_obj, _jump_state)
/// @description Control X movement of player from input and sprite direction.
/// @param _obj The object doing the X movement.
function handle_player_movement_x(_obj) {
	// Either 1 or -1 (or 0 if both or neither are pressed).
	_direction= 0
	if input_check("left") {
		_direction -= 1
	}
	if input_check("right") {
		_direction += 1
	}
	
	// Make player move along X, multiplied by speed.
	_obj.move_x = _direction * _obj.move_speed;

	// If player is moving on X axis.
	if (_obj.move_x != 0 ) {
		// Set direction of sprite image based on direction.
		image_xscale = sign(_obj.move_x);
	}
}