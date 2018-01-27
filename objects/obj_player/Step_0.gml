if (!ds_queue_empty(transmission_queue)) {
	var letter = ds_queue_dequeue(transmission_queue);
	switch (letter) {
		case up:
			y -= step_y;
			break;
		case down:
			y += step_y;
			break;
		case left:
			x -= step_x;
			break;
		case right:
			x += step_x;
			break;
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
