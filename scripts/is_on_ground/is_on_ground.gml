function is_on_ground(_object) {
	return place_meeting(_object.x, _object.y+_object.floor_margin, obj_ground);
}