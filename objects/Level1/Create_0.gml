/*
randomize();

global.TILE_SIZE=128;
global.LEVEL_NUM = 0;

for (var i =1; i < room_width div global.TILE_SIZE;i++)
{
	for(var j = 0; j < room_height div global.TILE_SIZE;j++)
	{
		instance_create_layer(i*global.TILE_SIZE, j*global.TILE_SIZE,"Walls",oWall);
	}
}

var dir = 0;

var maxDistanceX = 0;
var maxDistanceY =0;
var distance =0
var maxDistance = 0;

num_enemies_to_spawn = 2;
var num_enemies_spawned = 0;

repeat(150)
{
	if(chance(20)){
	dir = choose(0,1,2,3)*90;
	}
	
	var object = instance_place(x, y, oWall);
	
	instance_destroy(object);
	
	
	x+= lengthdir_x(global.TILE_SIZE, dir);
	y+= lengthdir_y(global.TILE_SIZE, dir);
	
	x = clamp(x, 0 + global.TILE_SIZE, room_width-global.TILE_SIZE*2);
	y = clamp(y, 0+ global.TILE_SIZE, room_height -global.TILE_SIZE*2);
	distance = point_distance(0,0,x,y)
	if(maxDistance < distance)
	{
		maxDistance = distance;
		maxDistanceX = x;
		maxDistanceY = y;
	}
	
	if (num_enemies_spawned < num_enemies_to_spawn) {
		// We need to spawn some enemies
		if (distance > 3*global.TILE_SIZE) {
			// This might be a good place to spawn an enemy
			if (chance(10)) {
				// 10 percent chance to spawn an enemy here 
				instance_create_layer(x, y, "Player", obj_enemy);
				num_enemies_spawned ++;
			}
		}
	}
}

*/
instance_create_layer(10,10,"Player", obj_player);
//instance_create_layer(maxDistanceX, maxDistanceY,"Exit", obj_exit);