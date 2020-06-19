if (instance_exists(oPlayer))
{
	if (sPlayer.image_index >= 1 && sPlayer.image_index < 2)
	{
		if (global.move == false)
		{
			x = oPlayer.x + 6;
			y = oPlayer.y + 12;
		}
		else
		{
			x = oPlayer.x - 6;
			y = oPlayer.y + 12;
		
		}
	}
	else
	{
		if (global.move == false)
		{
			x = oPlayer.x + 8;
			y = oPlayer.y + 8;
		}
		else
		{
			x = oPlayer.x - 8;
			y = oPlayer.y + 8;
		}
	}
	
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
