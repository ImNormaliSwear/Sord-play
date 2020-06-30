
if (hasWeapon)
{
	myGun = instance_create_layer(x, y, "Gun", oEGun);
	with (myGun)
	{
		owner = other.id;
	}
}
else
{
	myGun = noone;
}

arrow = 0;

if (hasSword)
{
	mySword = instance_create_layer(x, y, "Gun", oSword1);
	with (mySword)
	{
		owner = other.id;
	}
}
else
{
	mySword = noone;
}