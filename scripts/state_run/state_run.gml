// RUN state.
function state_run(_player) {
	// Handle falling.
	if !is_on_ground(_player) && move_y > 0 {
		_player.state = PLAYER_STATE.FALL;
	}
}