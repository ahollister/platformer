// ON GROUND state.
function state_on_ground(_player) {
	// While on ground, jump count is always reset and move_y is static.
	_player.jump_count = 0;
	_player.move_y = 0;
	
	// Trigger RUN | IDLE state.
	if sign(_player.move_x) != 0 {
		_player.state = PLAYER_STATE.RUN;
	} else {
		_player.state = PLAYER_STATE.IDLE;
	}
	
	// Trigger JUMP state.
	if input_check_pressed("accept") {
		_player.state = PLAYER_STATE.JUMP;
	}
}