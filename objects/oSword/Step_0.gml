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



if (wait != true && rest != true)
{
	if (mouse_check_button(mb_left))
	{
	image_angle = point_direction(x, y, mouse_x , mouse_y);
	stamina -= 5;
	}
}
if (stamina == 0) 
{
	rest = true;
}
if (rest == true)
{
	stamina += 1;
	if (stamina == maxStamina)
	{
		rest = false;
	}
}

if (stamina > maxStamina) 
{
	stamina = maxStamina;
	wait = false;
	rest = false;
}

if (!instance_exists(oGravity))
{
	instance_create_layer(x, y, "Gun", oGravity);
}

if (!mouse_check_button(mb_left) || wait == true || rest == true)
{
	if (stamina < maxStamina) 
	{
		wait = true;
	}
	if (wait == true)
	{
		stamina += 2;
	}
	image_angle = point_direction(x, y, oGravity.x, oGravity.y);
}