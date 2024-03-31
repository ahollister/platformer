function camera_follow_player(_player, _camera) {
	_half_view_width = camera_get_view_width(_camera) / 2;
	_half_view_height = camera_get_view_height(_camera) / 2;

	camera_set_view_pos( 
		_camera,
		_player.x - _half_view_width, 
		_player.y - _half_view_height 
	);
}