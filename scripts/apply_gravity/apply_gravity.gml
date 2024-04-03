/// @apply_gravity(_obj)
/// @description Apply a gravity effect to the character's move_y property using their fall_gravity and terminal_velocity properties.
/// @param _obj The object gravity is acting on.
function apply_gravity(_obj, _gravity_level) {
	_obj.move_y += _gravity_level;
	
	if (_obj.move_y >= _obj.terminal_velocity) {
		_obj.move_y = _obj.terminal_velocity;
	}
}