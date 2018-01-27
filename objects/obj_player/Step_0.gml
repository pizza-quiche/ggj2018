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
}