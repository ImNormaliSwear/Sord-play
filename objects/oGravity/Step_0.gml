if (instance_exists(oSword))
{
	x = oSword.x + lengthdir_x(57, oSword.image_angle);
	y = oSword.y + lengthdir_y(57, oSword.image_angle);
	if (!mouse_check_button(mb_left) || oSword.wait == true || oSword.rest == true)
	{
		vsp = (vsp + grv)
		y = y + vsp;
		
		while (place_meeting(x, y, oWall))
		{
			vsp = grv;
			y = y - (vsp);
		}
		//y = y + vsp;
	}
}