time_since_last_move ++;

// Wander
if(time_since_last_move > min_wait_time) {
	if (chance(10) || time_since_last_move >= max_wait_time) {	
		var new_x = x;
		var new_y = y;
		
		
		if (choose(1, -1) > 0) {
			if (choose(1, -1) > 0) {
				new_x = x + global.TILE_SIZE;
				sprite_index = spr_enemy_walk_right;
			} else {
				new_x = x - global.TILE_SIZE;
				sprite_index = spr_enemy_walk_left;
			}
		} else {
			new_y = y + choose(1, -1)*global.TILE_SIZE;
		}

		if (position_empty(new_x, new_y)) {
			x = new_x;
			y = new_y;
		
			time_since_last_move = 0;
		}
	}
}