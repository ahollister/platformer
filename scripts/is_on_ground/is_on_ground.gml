/// @is_on_ground(_obj)
/// @description This function returns true if the _obj is within the floor_margin of obj_ground.
/// @param _obj The object that we want to test for proximity to obj_ground.
/// @returns {Bool}
function is_on_ground(_obj) {
	return place_meeting(_obj.x, _obj.y+_obj.floor_margin, obj_ground);
}