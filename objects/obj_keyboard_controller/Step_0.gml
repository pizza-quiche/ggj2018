

// Check if key is being pressed, or has been pressed
var message_bit_to_add = -1;
if(keyboard_check(vk_space)) {
	// Key is being pressed right now. Increment counter.
	current_key_press_steps += 1;
} else {
	// Key is not being pressed right now. Has it been recently?
	if (current_key_press_steps > dash_steps) {
		// It was held down for a long time. Add a 1 to the buffer for a dash.
		message_bit_to_add = 1;
		current_time_to_live = default_time_to_live;
	} else if (current_key_press_steps > 0) {
		// It was held down for a little while. Add a 0 to the buffer for a dot.
		message_bit_to_add = 0;
		current_time_to_live = default_time_to_live;
	}

	// Regardless, it isn't being held down now. So set that counter back to zero.
	current_key_press_steps = 0;
}

// If this is false, we will keep the display string we have
var recalculate_string = false;

if (message_bit_to_add > -1) {
	ds_queue_enqueue(message_queue, message_bit_to_add);
	recalculate_string = true;
	
	// queue can only hold message_queue_max_size bits
	if (ds_queue_size(message_queue) > message_queue_max_size) {
		ds_queue_dequeue(message_queue);
	}
}

// If the time to live is at zero, destroy all the letters in the queue
var letter = noone;
if (current_time_to_live <= 0) {
	current_time_to_live = 0;
	letter = recognize_letter(message_queue);
	recalculate_string = true;
} else if (current_key_press_steps == 0) {
	current_time_to_live -= 1;
}

// Display dots and dashes on the screen corresponding to 0s and 1s in message queue
if (current_letter_lockout_time > 0) {
	// We are currently displaying a letter, so we just keep that on screen for a while.
	current_letter_lockout_time -= 1;
	
	if (current_letter_lockout_time == 0) {
		ds_queue_enqueue(player.transmission_queue, letter_to_transmit_to_player);
	}
} else if (recalculate_string) {
	current_letter_lockout_time = 0;
	
	display_string = ">";
	if (letter != noone) {
		// We have recognized a letter. Display it.
		display_string += " ";
		display_string += letter;
		current_letter_lockout_time = default_letter_lockout_time;
		letter_to_transmit_to_player = letter;
	} else {
		// No letter this time. Display everything on the queue.
		var message_queue_copy = ds_queue_create();
		ds_queue_copy(message_queue_copy, message_queue);
		while (!ds_queue_empty(message_queue_copy)) {
			var current_letter = ds_queue_dequeue(message_queue_copy);
			
			display_string += " ";
			switch (current_letter) {
				case 0:
					display_string += ".";
					break;
				case 1:
					display_string += "_";
					break;
			}
		}
		ds_queue_destroy(message_queue_copy);
	}
}

// Set the position of the text relative to the player
text_x = player.x - text_x_offset;
text_y = player.y - text_y_offset;
