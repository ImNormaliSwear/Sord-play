if (song1 > 0)
{
	audio_play_sound(snSong1, 10, false);
	song1--;
}

if (song1 <= 0 && song2 > 0)
{
	audio_play_sound(snSong2, 10, false);
	song2--;
}

if (song1 <= 0 && song2 <= 0 && song3 > 0)
{
	audio_play_sound(snSong3, 10, false);
	song3--;
}

if (song1 <= 0 && song2 <= 0 && song3 <= 0)
{
	song1 = 12240;
	song2 = 12960;
	song3 = 13200;
}