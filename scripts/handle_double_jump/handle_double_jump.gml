/// @handle_double_jump(_obj, _jump_state)
/// @description Allow character to transition to provided jump state if there are more jumps available.
/// @param _obj The object doing the double jumping.
/// @param _jump_state The state key for this object's JUMP state.
function handle_double_jump(_obj, _jump_state) {
	// Count the jump and reset the jump frames if jump is valid.
	if 
		input_check_pressed("accept") && // Player presses jump.
		_obj.jump_count > 0 && // Player has already jumped (prevents jump after falling off edge).
		_obj.jump_count < _obj.jump_max // Player still has jumps to use. 
	{
		_obj.jump_count++;
		_obj.jump_frames_remaining = _obj.jump_frames_max;
		// Trigger JUMP state.
		_obj.state = _jump_state;
	}
}