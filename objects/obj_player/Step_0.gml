// ----------
// ALL STATES
// ----------

// Collisions.
handle_collisions(obj_player);

// Apply gravity.
apply_gravity(obj_player);

// Handle X movement and sprite direction.
handle_player_movement_x(obj_player);

// Set sprite based on state.
obj_player.sprite_index = obj_player.sprites[obj_player.state];


// -------------------------------------------
// ON GROUND - Trigger RUN | IDLE | JUMP state
// -------------------------------------------
if is_on_ground(obj_player) {
	state_on_ground(obj_player);
}


// -----------------------------------------
// IDLE | RUN | FALL | JUMP | JUMPTOP STATES
// -----------------------------------------
	
// Run the relevant player state.
states[obj_player.state](obj_player);