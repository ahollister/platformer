/// @states_player(_obj)
/// @description This function defines the state machine for the player. 
/// It returns a states struct with the functionality for the various player states which are then controlled during STEP with the global set_state function.
/// @param _obj The player object.
/// @returns {Array<Function>}
function states_player(_obj) {
	
	// ---------
	// FUNCTIONS
	// ---------
	
	// Functionality global to all states.
	function all_states(_obj) {
		// Collisions.
		move_and_collide(_obj.move_x, _obj.move_y+2, _obj.collidables);
		// X movement and sprite direction.
		handle_player_movement_x(_obj);
	}
	
	// Trigger JUMP.
	function trigger_jump(_obj) {
		_obj.jump_count++;
		_obj.jump_frames_remaining = _obj.jump_frames_max;
		_obj.state = STATE_PLAYER.JUMP;
	};
	
	// Trigger JUMPTOP.
	function trigger_jumptop(_obj) {
		// Reset the remaining jumptop frames to max.
		_obj.jumptop_frames_remaining = _obj.jumptop_frames_max;
		// Enter JUMPTOP state.
		_obj.state = STATE_PLAYER.JUMPTOP;
	};
	
	// Reset some properties for ground behaviour.
	function ground_resets(_obj) {
		_obj.move_y = 0;
		_obj.jump_count = 0;
		_obj.coyote_frames = 0;
		_obj.coyote_frames_prev = 0;
		_obj.coyote_disabled = false;
	};
	


	// ------
	// STATES
	// ------
	states = {};


	// ----
	// IDLE
	// ----
	states[STATE_PLAYER.IDLE] = function(_obj) {
		// State agnostic code.
		all_states(_obj);
		
		// Gravity.
		apply_gravity(_obj, _obj.default_gravity);
		
		// Reset some properties for ground behaviour.
		if is_on_ground(_obj) {
			ground_resets(_obj);
		}
		
		// Handle JUMP transition.
		if input_check_pressed("accept") {
			trigger_jump(_obj);
		}
		
		// Handle RUN transition.
		if sign(_obj.move_x) != 0 {
			_obj.state = STATE_PLAYER.RUN;
		}
		
		// Handle FALL transition.
		if !is_on_ground(_obj) && move_y > 0 {
			_obj.state = STATE_PLAYER.FALL;
		}
	};
	
	
	// ---
	// RUN
	// ---
	states[STATE_PLAYER.RUN] = function(_obj) {
		// State agnostic code.
		all_states(_obj);
		
		// Gravity.
		apply_gravity(_obj, _obj.default_gravity);
		
		// Reset some properties for ground behaviour.
		if is_on_ground(_obj) {
			ground_resets(_obj);
		}
		
		// Handle JUMP transition.
		if input_check_pressed("accept") {
			trigger_jump(_obj);
		}
		
		// Handle IDLE transition.
		if sign(_obj.move_x) == 0 {
			_obj.state = STATE_PLAYER.IDLE;
		}
		
		// Handle FALL transition.
		if !is_on_ground(_obj) && move_y > 0 {
			_obj.state = STATE_PLAYER.FALL;
		}
	};
	
	
	// ----
	// JUMP
	// ----
	states[STATE_PLAYER.JUMP] = function(_obj) {
		// State agnostic code.
		all_states(_obj);
		
		// Gravity.
		apply_gravity(_obj, _obj.default_gravity);
		
		// Handle FALL transition.
		if !input_check("accept") {
			_obj.state = STATE_PLAYER.FALL;
		}

		// Jump.
		handle_jump_movement(_obj);
		
		// Jump Buffering.
		handle_jump_buffer(_obj);
		
		// Handle JUMPTOP transition.
		if _obj.jump_frames_remaining = _obj.jumptop_threshold {
			trigger_jumptop(_obj);
		}
	};
	
	
	// -------
	// JUMPTOP
	// -------
	states[STATE_PLAYER.JUMPTOP] = function(_obj) {
		// State agnostic code.
		all_states(_obj);
		
		// Gravity.
		apply_gravity(_obj, _obj.default_gravity);
		
		// Double jump if a valid one is triggered.
		handle_double_jump(_obj, STATE_PLAYER.JUMP);
	
		// Handle any ongoing jump movement.
		handle_jump_movement(_obj);
	
		// Jump Buffering.
		handle_jump_buffer(_obj);
	
		// Count the Jumptop timer.
		_obj.jumptop_frames_remaining--;
	
		// Jump and Jumptop timers ended. Trigger Fall state.
		if _obj.jump_frames_remaining = 0 && _obj.jumptop_frames_remaining = 0 {
			_obj.state = STATE_PLAYER.FALL;
		}
	};
	
	
	// ----
	// FALL
	// ----
	states[STATE_PLAYER.FALL] = function(_obj) {
		// State agnostic code.
		all_states(_obj);
		
		// Gravity.
		apply_gravity(_obj, _obj.fall_gravity);
		
		// Landing.
		if is_on_ground(_obj) {
			_obj.state = STATE_PLAYER.IDLE;
		}

		// End any jumps.
		_obj.jump_frames_remaining = 0;
	
		// Double jump.
		handle_double_jump(_obj, STATE_PLAYER.JUMP);
		
		// Jump Buffering.
		handle_jump_buffer(_obj);
		
		// Coyote Jumps.
		handle_coyote_jump(_obj);
	
		// Otherwise Gravity will do the rest...
	};
	
	
	return states;
}