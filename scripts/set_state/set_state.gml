/// @set_state(_obj)
/// @description This function runs the relevant state function from _obj.states based on the current state of the object.
/// @param _obj The object who's state code is being run.
function set_state(_obj){
	_obj.states[_obj.state](_obj);
}