/// @description Move the bullet, then run the collision

// Change the bullet's location
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

// Check for collision with pShootbale, then with oWall (below)
if (place_meeting(x, y, pShootable))
{
	with (instance_place(x, y, pShootable)) // in this case, other is the Enemy hit
	{
		hp--;
		flash = 3;
		hitfrom = other.direction;
	}
	instance_destroy();
}

if (place_meeting(x, y, oWall) && image_index != 0)
{
	
	spd = 0;
	instance_change(oHitSpark, true); // Destroy the bullet and put a hit spark in this location	
	layer_add_instance("Tiles", id); // Put this on the tiles layer...
	depth += 1; // Plus one depth 
	
	// Back out the collision so it shows as colliding with the edge of the wall
	while (place_meeting(x, y, oWall))
	{
		x -= lengthdir_x(1, direction);
		y -= lengthdir_y(1, direction);
	}
}
	
