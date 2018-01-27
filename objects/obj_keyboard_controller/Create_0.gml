dash_steps = 10;

current_key_press_steps = 0;

message_queue = ds_queue_create();
message_queue_max_size = 4;

default_time_to_live = 25;
current_time_to_live = 0;

display_string = "";
default_letter_lockout_time = 20;
current_letter_lockout_time = 0;

player = instance_find(obj_player, 0);
text_x_offset = 10;
text_y_offset = 20;
letter_to_transmit_to_player = noone;

// Create the morse code letter dictionary
global.morse_dictionary = ds_map_create();
ds_map_add(global.morse_dictionary, "01", "A");
ds_map_add(global.morse_dictionary, "1000", "B");
ds_map_add(global.morse_dictionary, "1010", "C");
ds_map_add(global.morse_dictionary, "100", "D");
ds_map_add(global.morse_dictionary, "0", "E");
ds_map_add(global.morse_dictionary, "0010", "F");
ds_map_add(global.morse_dictionary, "110", "G");
ds_map_add(global.morse_dictionary, "0000", "H");
ds_map_add(global.morse_dictionary, "00", "I");
ds_map_add(global.morse_dictionary, "0111", "J");
ds_map_add(global.morse_dictionary, "101", "K");
ds_map_add(global.morse_dictionary, "0100", "L");
ds_map_add(global.morse_dictionary, "11", "M");
ds_map_add(global.morse_dictionary, "10", "N");
ds_map_add(global.morse_dictionary, "111", "O");
ds_map_add(global.morse_dictionary, "0110", "P");
ds_map_add(global.morse_dictionary, "1101", "Q");
ds_map_add(global.morse_dictionary, "010", "R");
ds_map_add(global.morse_dictionary, "000", "S");
ds_map_add(global.morse_dictionary, "1", "T");
ds_map_add(global.morse_dictionary, "001", "U");
ds_map_add(global.morse_dictionary, "0001", "V");
ds_map_add(global.morse_dictionary, "011", "W");
ds_map_add(global.morse_dictionary, "1001", "X");
ds_map_add(global.morse_dictionary, "1011", "Y");
ds_map_add(global.morse_dictionary, "1100", "Z");

