function handle_collisions(_player) {
	move_and_collide(_player.move_x, _player.move_y+2, [obj_ground, obj_wall]);
}