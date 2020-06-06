
var _scale = .25;

#region Logo
if (timer < room_speed * 5) {
	// Fade configuration
	var _fade = room_speed * .86;
	var _end  = room_speed * 1.58 + _fade;
	
	// Fade in
	var _frac = timer / _fade;
	// Fade out
	if (timer > _end) {
		_frac = 1 - (timer - _end) / _fade;
	}
	
	// Background
	draw_set_color($211a19);
	if (timer > _end) draw_set_alpha(_frac + .3);
	draw_rectangle(0, 0, width + 1, height + 1, false);
	draw_set_alpha(1);
	draw_set_color(c_white);

	// High-res logo
	gpu_set_tex_filter(true);
	draw_sprite_ext(
		spr_logo_tonystr,
		0,
		width / 2,
		height / 2,
		.25,
		.25,
		0,
		c_white,
		_frac
	);
	gpu_set_tex_filter(false);
}
#endregion;

#region End credits
if (credits) {
	var _index = min(floor(credits / (room_speed * 1.7)), array_length_1d(credits_text) - 1);
	var _alpha = 1 + dcos(credits / 360);
	
	if (credits > room_speed * .5 && (keyboard_check(vk_anykey) || mouse_check_button_pressed(mb_any))) {
		url_open("https://twitter.com/TonyStr_");
		game_end();
	}
	
	// Background
	draw_set_color($3d1b22);
	draw_set_alpha(_alpha);
	draw_rectangle(0, 0, width + 1, height + 1, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	if (_index < array_length_1d(credits_text)) {
		draw_set_halign(fa_center);
		draw_text_transformed(width / 2, height / 2, credits_text[_index], _scale, _scale, 0);
		draw_set_valign(fa_middle);
	}
}
#endregion;

#region Level clear

if (respawn_timer && level_clear_message) {
	var _fr = level_clear_time - respawn_timer;
	// Fade configuration
	var _fade = level_clear_time * .15;
	var _end  = level_clear_time * .7 + _fade;
	
	// Fade in
	var _frac = _fr / _fade;
	// Fade out
	if (_fr > _end) {
		_frac = 1 - (_fr - _end) / _fade;
	}
	
	// Background
	draw_set_color($211a19);
	if (_fr > _end) draw_set_alpha(_frac + .3);
	draw_rectangle(0, 0, width + 1, height + 1, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	draw_set_halign(fa_center);
	draw_text_transformed(width / 2, height / 2 - 9, "Wow nice, you completed level " + string(level), _scale, _scale, 0);
	draw_text_transformed(width / 2, height / 2 + 9, "Only " + string(5 - level) + " more to go!", _scale, _scale, 0);		
	draw_set_valign(fa_middle);
}

#endregion;