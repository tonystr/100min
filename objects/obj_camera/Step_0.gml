
timer++;
if (credits) credits++;

if (random(1) < 1.4 / room_speed) {
	instance_create_depth(-10, room_height - 34 - 32 * irandom_range(0, 2), depth - 10, obj_car);
}

if (random(1) < 1.4 / room_speed) {
	var _ind = irandom_range(0, 3);
	var _dir = (_ind % 2) * 2 - 1;
	with (instance_create_depth(room_width / 2 - _dir * (room_width / 2 + 49), 32 * _ind, depth - 10, obj_floater)) {
		dir = _dir;
	}
}

if (respawn_timer && !--respawn_timer) {
	with (obj_player) if (kill_me) instance_destroy();
	instance_create_depth(room_width / 2, room_height - 12, depth - 89, obj_player);
	level_clear_message = false;
}