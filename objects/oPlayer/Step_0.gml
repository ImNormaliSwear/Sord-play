/// @description Every frame







if (has_control)
{
	// Get player input
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);

	if (key_left || key_right || key_jump)
		controller = 0;
	
	if (abs(gamepad_axis_value(0, gp_axislh)) > 0.05)
	{
		key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
		key_right = max(gamepad_axis_value(0, gp_axislh), 0);
		controller = 1;
	}

	if (gamepad_button_check_pressed(0, gp_shoulderlb))
	{
		controller = 1;
		key_jump = 1;
	}
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}


// Calculate movement
var move = key_right - key_left;

hsp = (move * walksp) + gunKickX;
gunKickX = 0;


vsp = (vsp + grv) + gunKickY;
gunKickY = 0;

// Jumping
canJump -= 1;
if (canJump > 0 && key_jump)
{
	vsp = -7;
	canJump = 0;
}

// Horizontal collision
if (place_meeting(x+hsp, y, oWall))
{
	// Move over one pixel at a time until we're touching the wall
	while (!place_meeting(x+sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

// Vertical collision
if (place_meeting(x, y+vsp, oWall))
{
	// Move over one pixel at a time until we're touching the wall
	while (!place_meeting(x, y+sign(vsp), oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;


///////////////
// Animation
///////////////

var aimSide = sign(mouse_x - x); // +1 for mouse on the right of the player, -1 otherwise
if (aimSide != 0)
{
	image_xscale = aimSide;
	
}
if (aimSide == 1)
{
	global.move = true;
	global.yeet = false;
}
else
{
	global.move = false;
	global.yeet = true;
}

if (!place_meeting(x, y + 1, oWall)) // If player is in the air
{
	if (instance_exists(oSword))
	{
		sprite_index = sPlayerAW;
		image_speed = 0;
		if (sign(vsp) > 0) 
		image_index = 1; // Falling
		else 
		image_index = 0; // Jumping
	}
	else
	{
		sprite_index = sPlayerA;
		image_speed = 0;
		if (sign(vsp) > 0) 
		image_index = 1; // Falling
		else 
		image_index = 0; // Jumping
	}
}
else // Player is on the ground
{
	canJump = 10; // 10 frames left to jump
	if (sprite_index == sPlayerA) 
	{
		// if we were just in the air, then play a sfx now that we landed
		audio_sound_pitch(snLanding, choose(0.8, 1.0, 1.2)); // adjust pitch randomly slightly
		audio_play_sound(snLanding, 10, false);
		// Make some dust appear under the player when they land
		repeat(5)
		{
			with (instance_create_layer(x, bbox_bottom, "Bullets", oDust))
			{
				vsp = 0;
			}
		}
	}
	image_speed = 1;
	if (instance_exists(oSword))	
	{
		if (hsp == 0)
		{
			sprite_index = sPlayer; // Standing
		}
		else
		{
			sprite_index = sPlayerRW; // Running
			if (aimSide != sign(hsp))
			{	
				sprite_index = sPlayerRbw; // Run backwards
			}
		}
	}
	else
	{
		if (hsp == 0)
		{
			sprite_index = sPlayerIdle; // Standing
		}
		else
		{
			sprite_index = sPlayerR; // Running
			if (aimSide != sign(hsp))
			{	
				sprite_index = sPlayerRb; // Run backwards
			}
		}
	}
}

// Removed when we started using strafe animations
//if (sign(hsp) != 0) // If we're moving
//	image_xscale = sign(hsp); // Flip player image left or right accordingly
	

