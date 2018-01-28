if (sprite_index == spr_player_death) {
	// That means we just died. Destroy self!
	instance_destroy(id)
	room_goto(gameOver);
} else {
	// We didn't just die. Whew!
	// Return to idle state
	sprite_index = spr_player_idle;
}

if (sprite_index == spr_player_initial_spawn) {
	// That means we just teleported. 
	var object = instance_place(x, y, obj_player);
	
	instance_destroy(object);
	room_goto(room0);
} else {
	// We didn't just teleport. Whew!
	// Return to idle state
	sprite_index = spr_player_idle;
}
