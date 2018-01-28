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
		var object = instance_place(new_x, new_y, oWall);
		var exitObject = instance_place(new_x, new_y, obj_exit);
		if (!object && !exitObject) {
			x = new_x;
			y = new_y;
			
			x = clamp(x, 0 + global.TILE_SIZE, room_width-global.TILE_SIZE*2);
			y = clamp(y, 0+ global.TILE_SIZE, room_height -global.TILE_SIZE*2);
			time_since_last_move = 0;
		}
	}
}