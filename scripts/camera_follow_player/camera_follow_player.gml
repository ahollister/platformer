function camera_follow_player(_player, _camera) {
	_viewx = lerp(_viewx, _player.x, 0.08)
	_viewy = lerp(_viewy, _player.y, 0.08)
	_half_view_width = camera_get_view_width(_camera) / 2;
	_half_view_height = camera_get_view_height(_camera) / 2;

	camera_set_view_pos( 
		_camera,
		_viewx - _half_view_width, 
		_viewy - _half_view_height 
	);
}