/// @description Insert description here
// You can write your code in this editor
global.LEVEL_NUM++

if(global.LEVEL_NUM >3) {
	room_goto(room01);
	
}
var object = instance_place(x, y, obj_player);
	
	instance_destroy(object);


room_goto(room0);

