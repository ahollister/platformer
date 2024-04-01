/// @set_sprite(_obj)
/// @description This function sets the sprite_index on an object based on its current state. 
/// @param _obj The object who's sprite is being set.
function set_sprite(_obj){
	_obj.sprite_index = _obj.sprites[_obj.state];
}