other.hp--;

while (place_meeting(x, y, oEnemy))
{
	x -= lengthdir_x(1, direction);
	y -= lengthdir_y(1, direction);
}
spd = 0;
