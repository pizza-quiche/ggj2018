queue = argument0

var key = "";
while (!ds_queue_empty(queue)) {
	key += string(ds_queue_dequeue(queue));
}

if (!ds_map_exists(global.morse_dictionary, key)) {
	return noone;
} else {
	return global.morse_dictionary[? key];
}