/// @description 

#macro RES_W 1024
#macro RES_H 768
//#macro DICEROLL irandom(6) // cool save for later

display_set_gui_size(RES_W, RES_H);

global.kills = 0;
global.killsThisRoom = 0;
killTextScale = 1;

global.hasGun = false;