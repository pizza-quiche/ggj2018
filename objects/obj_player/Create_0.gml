up = "U"
down = "D"
left = "L"
right = "R"

step_x = global.TILE_SIZE;
step_y = global.TILE_SIZE;

transmission_queue = ds_queue_create();

konami_code = ds_list_create()
ds_list_add(konami_code, "U");
ds_list_add(konami_code, "U");
ds_list_add(konami_code, "D");
ds_list_add(konami_code, "D");
ds_list_add(konami_code, "L");
ds_list_add(konami_code, "R");
ds_list_add(konami_code, "L");
ds_list_add(konami_code, "R");
ds_list_add(konami_code, "B");
ds_list_add(konami_code, "A");
konami_code_index = 0;
konami_code_win_index = ds_list_size(konami_code);

instance_create_layer(x, y, "Player", obj_keyboard_controller);
