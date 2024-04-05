// -----
// STATS
// -----

// Health
hp = 100

// X Movement.
move_x = 0;
move_y = 0;
move_speed = 5;

// Jump.
jump_speed = -11;
jump_frames_remaining = 0;
jump_frames_max = 10;
jump_count = 0;
jump_max = 2;
jump_buffer_frames = 0;
jump_buffer_frames_max = 9;
jump_buffer_attempted = false;

// Coyote Jump.
coyote_frames = 0;
coyote_frames_prev = 0;
coyote_frames_max = 8;
coyote_disabled = false;

// Jumptop.
jumptop_threshold = 4
jumptop_frames_remaining = 0;
jumptop_frames_max = 13;

// Gravity.
default_gravity = 1;
fall_gravity = 1.6;
terminal_velocity = 18;

// Camera
camera_follow_threshold = 400;
camera_should_follow = false;
original_x = 0;
original_y = 0;


// Used as a margin for collisions.
floor_margin = 4;

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
}

// Setup states.
states = states_player(obj_player);

// Setup sprites.
sprites = sprites_player();

// Initial state.
state = STATE_PLAYER.IDLE
