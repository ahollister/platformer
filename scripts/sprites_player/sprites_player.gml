/// @sprites_player(_obj)
/// @description 
/// This function defines the sprites for the player in a struct indexed by state.
/// It returns an array of the sprites for the various player states which are then controlled during STEP with the global set_sprite function.
/// @returns {Array<Asset.GMSprite>}
function sprites_player() {	
	sprites = {};

	sprites[STATE_PLAYER.IDLE] = spr_player_idle;
	sprites[STATE_PLAYER.RUN] = spr_player_run;
	sprites[STATE_PLAYER.JUMP] = spr_player_jump;
	sprites[STATE_PLAYER.FALL] = spr_player_fall;
	sprites[STATE_PLAYER.JUMPTOP] = spr_player_jump_top;
	sprites[STATE_PLAYER.PUNCH] = spr_player_punch;

	return sprites;
}
