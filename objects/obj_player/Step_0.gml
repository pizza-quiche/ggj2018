if (!ds_queue_empty(transmission_queue)) {
	var letter = ds_queue_dequeue(transmission_queue);
	var new_x = x;
	var new_y = y;

	switch (letter) {
		case up:
			new_y = y - step_y;
			sprite_index = spr_player_walk_up;
			break;
		case down:
			new_y = y + step_y;
			sprite_index = spr_player_walk_down;
			break;
		case left:
			new_x = x - step_x;
			sprite_index = spr_player_walk_left;
			break;
		case right:
			new_x = x + step_x;
			sprite_index = spr_player_walk_right;
			break;
	}
	var object = instance_place(new_x, new_y, oWall);
	if (!object) {
			x = new_x;
			y = new_y;
			
			x = clamp(x, 0 + global.TILE_SIZE, room_width-global.TILE_SIZE*2);
			y = clamp(y, 0+ global.TILE_SIZE, room_height -global.TILE_SIZE*2);
	} else {
		// Maybe play some animation where it tries to move but can't?
	}
	
	var current_konami_letter = konami_code[| konami_code_index];
	if (letter == current_konami_letter) {
		konami_code_index += 1;
	} else {
		konami_code_index = 0;
	}
}

if (konami_code_index == konami_code_win_index) {
	konami_code_index = 0;
	
	image_blend = make_colour_hsv(random(255), 255, 255);
}
