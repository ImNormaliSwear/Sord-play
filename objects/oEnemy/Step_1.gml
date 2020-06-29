/// @description Insert description here
// You can write your code in this editor


if (hp <= 0)
{
	with(instance_create_layer(x, y, layer, oDead))
	{
		if (global.yeet == true)
		{
			direction = other.hitfrom;
			hsp = lengthdir_x(-10, direction);
			vsp = lengthdir_y(3, direction) - 10;
			if (sign(hsp) != 0)
			image_xscale = sign(hsp) * other.size;
			image_yscale = other.size;
		}
		else
		{
			direction = other.hitfrom;
			hsp = lengthdir_x(10, direction);
			vsp = lengthdir_y(3, direction) - 10;
			if (sign(hsp) != 0)
			image_xscale = sign(hsp) * other.size;
			image_yscale = other.size;
		}
	}
	if (hasWeapon)
	{
		with (myGun) instance_destroy();
	}
	if (instance_exists(oPlayer))
	{
		global.kills++;
		global.killsThisRoom++;
		with (oGame) killTextScale = 2;
	}	
	instance_destroy();
}
else
{
	if (arrow == 2)
	{
		with(instance_create_layer(x, y, layer, oDead1))
		{
			if (global.yeet == false)
			{
				direction = other.hitfrom;
				hsp = lengthdir_x(10, direction) ;
				vsp = lengthdir_y(3, direction) - 5;
				if (sign(hsp) != 0)
				image_xscale = sign(hsp) * other.size;
				image_yscale = other.size;
			}
			else
			{
				direction = other.hitfrom;
				hsp = lengthdir_x(-10, direction) ;
				vsp = lengthdir_y(3, direction) - 5;
				if (sign(hsp) != 0)
				image_xscale = sign(hsp) * other.size;
				image_yscale = other.size;
			}
		}
		if (hasWeapon)
		{
			with (myGun) instance_destroy();
		}
		if (instance_exists(oPlayer))
		{
			global.kills++;
			global.killsThisRoom++;
			with (oGame) killTextScale = 2;
		}
		instance_destroy();
	}
}
