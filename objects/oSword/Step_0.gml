if (instance_exists(oPlayer))
{
	x = oPlayer.x - 5;
	y = oPlayer.y + 10;

	image_angle = point_direction(x, y, mouse_x , mouse_y);

	if (place_meeting(x, y, pShootable))
	{
		with (instance_place(x, y, pShootable)) // in this case, other is the Enemy hit
		{
			hp -= 4;
			flash = 3;
			hitfrom = other.direction;
		}
	}
}
else
{
	instance_destroy();
}
