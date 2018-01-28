if (sprite_index == spr_player_death) {
	// That means we just died. Destroy self!
	instance_destroy(id);
	room_goto(gameOver);
} else if (sprite_index == spr_player_initial_spawn) {
	// That means we just teleported.
	audio_play_sound(teleport, 1, false);
	instance_destroy(id);
	room_goto(room0);
}else {
	// We didn't just die. Whew!
	// Return to idle state
	sprite_index = spr_player_idle;
}

