
randomize();

#macro TILE_SIZE 128

for (var i =1; i < room_width div TILE_SIZE;i++)
{
	for(var j = 0; j < room_height div TILE_SIZE;j++)
	{
		instance_create_layer(i*TILE_SIZE, j*TILE_SIZE,"Instances",oWall);
	}
}

var dir = 0;

var maxDistanceX = 0;
var maxDistanceY =0;
var distance =0
var maxDistance = 0;

repeat(150)
{
	if(chance(20)){
	dir = choose(0,1,2,3)*90;
	}
	
	var object = instance_place(x, y, oWall);
	
	instance_destroy(object);
	
	x+= lengthdir_x(TILE_SIZE, dir);
	y+= lengthdir_y(TILE_SIZE, dir);
	
	x = clamp(x, 0 + TILE_SIZE, room_width-TILE_SIZE*2);
	y = clamp(y, 0+ TILE_SIZE, room_height -TILE_SIZE*2);
	distance = point_distance(0,0,x,y)
	if(maxDistance < distance)
	{
		maxDistance = distance;
		maxDistanceX = x;
		maxDistanceY = y;
	}
	
}


instance_create_layer(0,0,"Instances", player);
instance_create_layer(maxDistanceX, maxDistanceY,"Instances",player);