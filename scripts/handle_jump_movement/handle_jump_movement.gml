/// @handle_jump_movement(_obj)
/// @description This function check if there are jump frames left, reduces the remaining jump frames and moves _obj upwards by _obj.jump_speed.
/// @param _obj The object that is jumping.
function handle_jump_movement(_obj) {
	if _obj.jump_frames_remaining > 0 {
		_obj.jump_frames_remaining--;
		_obj.move_y = _obj.jump_speed;
	}
}