/// @description Insert description here
// You can write your code in this editor

// Debug
draw_set_font(font_chunk);
draw_text(0, 0, "debug");
if (keyboard_check(vk_space)) {
	draw_text(50, 0, "space");
}
draw_text(100, 0, "current_key_press_steps="+string(current_key_press_steps));

draw_text(50, 50, display_string);	
