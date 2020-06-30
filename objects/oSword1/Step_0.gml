if (global.emove = false)
{
	x = owner.x + 6;
	y = owner.y + 12;
	image_angle = point_direction(x, y, x + random_range(6, -6), y - 5);
}
else 
{
	x = owner.x + 8;
	y = owner.y + 8;
	image_angle = point_direction(x, y, x + random_range(6, -6), y - 5);
}

