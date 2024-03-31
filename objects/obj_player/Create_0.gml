// Health
hp = 100

// X Movement.
move_x = 0;
direction = 0;
move_y = 0;
move_speed = 7;

// Set player collision mask.
mask_index = sprite_index;

// JUMP.
jump_speed = -10;
jump_frames_remaining = 0;
jump_frames_max = 12;
jump_count = 0;
jump_max = 2;

// JUMPTOP.
jumptop_threshold = 4
spin_frames_remaining = 0;
spin_frames_max = 15;

// Gravity.
fall_gravity = 1;
terminal_velocity = 18;

// Used as a margin for collisions.
floor_margin = 3;

// Player states.
enum PLAYER_STATE {
	IDLE,
	RUN,
	JUMP,
	JUMPTOP,
	FALL,
}

// Initial player state.
state = PLAYER_STATE.IDLE

// State functions.
states = [];
states[PLAYER_STATE.IDLE] = state_idle;
states[PLAYER_STATE.RUN] = state_run;
states[PLAYER_STATE.JUMP] = state_jump;
states[PLAYER_STATE.FALL] = state_fall;
states[PLAYER_STATE.JUMPTOP] = state_jumptop;

// Sprites.
sprites = [];
sprites[PLAYER_STATE.IDLE] = spr_player_idle;
sprites[PLAYER_STATE.RUN] = spr_player_run;
sprites[PLAYER_STATE.JUMP] = spr_player_jump;
sprites[PLAYER_STATE.FALL] = spr_player_fall;
sprites[PLAYER_STATE.JUMPTOP] = spr_player_jump_top;


// Allow WASD for movement.
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("D"), vk_right);