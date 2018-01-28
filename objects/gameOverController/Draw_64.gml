draw_set_color(c_black);
draw_set_font(font_chunk);
draw_text(global.TILE_SIZE * 4, global.TILE_SIZE * 2, "GAME OVER");

draw_text(global.TILE_SIZE * 4, global.TILE_SIZE * 3, "Enter to restart");
draw_text(global.TILE_SIZE * 4, global.TILE_SIZE * 3 + 10, "Escape to quit");