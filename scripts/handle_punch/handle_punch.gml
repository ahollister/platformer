// Script assets have change/// @handle_punch(_obj, _punch_state)
/// @description Allow character to transition to provided punch state.
/// @param _obj The object doing the punching.
/// @param _punch_state The state key for this object's PUNCH state.
function handle_punch(_obj, _punch_state) {
	// Punch on action press.
	if input_check_pressed("action") {
		// Reset the punch frames.
		_obj.punch_frames_remaining = _obj.punch_frames_max;
		// Enter PUNCH state.
		_obj.state = _punch_state;
	}

}
