function handle_coyote_jump(_obj) {
	// Player not on ground and not jumping (so probably falling off an edge).
	if !is_on_ground(_obj) && _obj.jump_count == 0 {
		
		// If coyote timer hasn't been started yet and hasn't been disabled.
		if _obj.coyote_frames == 0 && !_obj.coyote_disabled {
			// Start it.
			_obj.coyote_frames = _obj.coyote_frames_max;
		}
	
		// If there's still coyote frames left and player hits jump, jump.
		if _obj.coyote_frames > 0 && input_check_pressed("accept") {
			trigger_jump(_obj);
			// Disable further coyote jumps.
			_obj.coyote_frames = 0;
			_obj.coyote_disabled = true;
		}
		
		if !_obj.coyote_disabled {
			// Store coyote timer value.
			_obj.coyote_frames_prev = _obj.coyote_frames;
		
			// Decrement coyote timer.
			--_obj.coyote_frames;
		}
		
		
		// If coyote frames hits 0 and has been counting, disable it before the next frame.
		if _obj.coyote_frames == 0 && _obj.coyote_frames_prev == 1 {
			show_debug_message("DISABLED")
			_obj.coyote_disabled = true;
		}
	}
}