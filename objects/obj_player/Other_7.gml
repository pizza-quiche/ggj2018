if (sprite_index == spr_player_teleport_out) {
	// This happens when the level ends and when we die. Check which.
	if (dead) {
		// That means we just died. Destroy self!
		instance_destroy(id);
		room_goto(gameOver);
	} else {
		// That means we just teleported.
        audio_play_sound(teleport, 1, false);
		instance_destroy(id);
		room_goto(room0);
	}
} else {
	// We didn't just die. Whew!
	// Return to idle state
	sprite_index = spr_player_idle;
}

