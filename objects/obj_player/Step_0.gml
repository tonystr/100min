
x += xvel * 1 * !locked;
y += yvel * 1 * !locked;

xvel = keyboard_check(ord("D")) - keyboard_check(ord("A"));
yvel = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Game end credits
//if (keyboard_check_pressed(vk_enter)) {
//	obj_camera.credits = 1;	
//}

if (bbox_right < 0 || bbox_left > room_width) {
	sprite_index = spr_no;
	obj_camera.respawn_timer = obj_camera.respawn_time * 2;
	locked = true;
	kill_me = true;
	x = room_width / 2;
	y = room_height / 2;
}

// Car accident
if (place_meeting(x, y, obj_car) && !locked) {
	depth = 40;
	sprite_index = spr_frog_dead;
	obj_camera.respawn_timer = obj_camera.respawn_time;
	locked = true;
	image_angle = irandom(3) * 90;
}

// When in cold waters
var _floater = instance_place(x, y, obj_floater);
if (bbox_bottom < 128) {
	// Bad splash
	if (_floater == noone && bbox_top > 0) {
		sprite_index = spr_splash;
		locked = true;
	
	// We gucchi
	} else {
		xvel += _floater.spd * _floater.dir;
	}
	
	// He (the frog, AKA Teddy (not the player because they is just a projection of character onto which the froggo Teddy is painted)) cleared the level BAYBE
	if (bbox_bottom < 10) {
		if (obj_camera.level == 5) {
			obj_camera.credits = 1;	
		} else {
			with (obj_camera) {
				respawn_timer = level_clear_time;
				level++;
				level_clear_message = true;
			}
		}
		instance_destroy();
	}
}