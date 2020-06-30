/// @description 

gunSprite = layer_sprite_get_id("TitleAssets", "gGun");

// If we have the gun and killed at least one dude...
if (global.hasGun && global.kills > 0)
{
	endText[0] = "You killed " + string(global.kills) + " knights.";
	if (global.kills == 1)
		endText[0] = "You ventured through death.";
	endText[1] = "Only to aquire what was not there.";
	endText[2] = "You wandered the lands in search of the princess.";
	endText[3] = "Only to find out there was no princess.";
	endText[4] = "You just slaughtered knights defending their land from a warmonger.";
	endText[5] = "The signs were set up by some prankster.";
	endText[6] = "The end.";
}
else 
{
	layer_sprite_destroy(gunSprite);
	endText[0] = "And on this day our hero had a wonderful, serene walk through the national park\nand didn't murder anyone.";
	endText[1] = "They reported a discarded firearm to the local authorities\nand were thanked profusely for assisting in ongoing crimes.";
	endText[2] = "And all it took was behavior that outside of a videogame context\nnone would hope is completely normal.";
	endText[3] = "Who would have thought?";
	endText[4] = "The end.";
}

spd = 0.5;
letters = 0;
currentLine = 0;
length = string_length(endText[currentLine]);
text = "";