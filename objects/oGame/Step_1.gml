if (song1 == 12240)
{
	songplaying1 = true;
	audio_play_sound(snSong1, 10, false);
}

if (song2 == 12960 && song1 <= 0)
{
	songplaying1 = false;
	songplaying2 = true;
	audio_play_sound(snSong2, 10, false);
}

if (song3 == 13200 && song2 <= 0 && song1 <= 0)
{
	songplaying2 = false;
	songplaying3 = true;
	audio_play_sound(snSong3, 10, false);
}

if (song1 <= 0 && song2 <= 0 && song3 <= 0)
{
	songplaying3 = false;
	song1 = 12240;
	song2 = 12960;
	song3 = 13200;
}