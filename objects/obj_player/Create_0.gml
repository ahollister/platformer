// -----
// STATS
// -----

// Health
hp = 100

// X Movement.
move_x = 0;
move_y = 0;
move_speed = 7;

// Jump.
jump_speed = -10;
jump_frames_remaining = 0;
jump_frames_max = 12;
jump_count = 0;
jump_max = 2;

// Jumptop.
jumptop_threshold = 4
jumptop_frames_remaining = 0;
jumptop_frames_max = 15;

// Punch.
punch_frames_remaining = 0;
punch_frames_max = 10;

// Gravity.
fall_gravity = 1;
terminal_velocity = 18;

// Used as a margin for collisions.
floor_margin = 3;

// Set player collision mask.
mask_index = sprite_index;

// Set player collidables.
collidables = global.collidables;


// -----
// STATE
// -----

// Possible states.
enum STATE_PLAYER {
	IDLE,
	RUN,
	JUMP,
	JUMPTOP,
	FALL,
	PUNCH,
}

// Setup states.
states = states_player(obj_player);

// Setup sprites.
sprites = sprites_player();

// Initial state.
state = STATE_PLAYER.IDLE
