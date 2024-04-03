
function handle_jump_buffer(_obj) {
	// If player hits jump
	if input_check_pressed("accept") {
		_obj.jump_buffer_frames = _obj.jump_buffer_frames_max
	
		// Set a jump attempt flag for jump buffer frames length
		_obj.jump_buffer_attempted = true
	}
	
	// If player is on ground within buffer frames and attempted a jump, trigger the jump.
	if 
		is_on_ground(_obj) && 
		_obj.jump_buffer_attempted && 
		_obj.jump_buffer_frames > 0 
	{
		_obj.jump_buffer_attempted = false
		trigger_jump(_obj)
	}
	
	// Countdown the buffer frames.
	--_obj.jump_buffer_frames
}