/// @description 

#macro RES_W 1024
#macro RES_H 768
//#macro DICEROLL irandom(6) // cool save for later

display_set_gui_size(RES_W, RES_H);

global.kills = 0;
global.killsThisRoom = 0;
killTextScale = 1;

global.hasGun = false;

playsong = 0;

song1 = 12240;
song2 = 12960;
song3 = 13200;