draw_self();
if (instance_exists(oSword))
{
	var divisor = oSword.maxStamina / 100;
	var stamina100 = oSword.stamina / divisor;
	draw_healthbar(x-20, y-28, x+20, y-22, stamina100, c_black, c_blue, c_blue, 0, true, false);
}

draw_self();
DrawSetText(c_white, fMenu, fa_left, fa_right)
draw_text(x, y - 50, oGame.song1)
draw_text(x, y - 70, oGame.song2)
draw_text(x, y - 90, oGame.song3)