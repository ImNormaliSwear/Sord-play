//x -= lengthdir_x(spd, direction);
//y -= lengthdir_y(spd, direction);
instance_create_layer(x, y, "Bullets", oHitSpark)
if (direction > 180)
{
	image_xscale *= -1;
	direction -=  180;
}

else
{
	image_xscale *= -1;
	direction += 180;
}
