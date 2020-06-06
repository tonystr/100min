// @arg target

width  = 480;
height = 270;
zoom   = 4;
window_set_fullscreen(true);

camera = camera_create();
view_camera[0]  = camera;
view_visible[0] = true;
view_enabled    = true;

window_set_size(width * zoom, height * zoom);
surface_resize(application_surface, width * zoom, height * zoom);
display_set_gui_size(width, height);
camera_set_view_size(camera, width, height);
window_set_position(
	(display_get_width()  - width  * zoom) / 2,
	(display_get_height() - height * zoom) / 2
);

camera_set_view_pos(
	camera,
	0,
	0
);

timer = floor(-room_speed * .6);
credits = -1;

credits_text = [
	"Congratulations! You won",
	"Thank you for playing",
	"Click anywhere or press anything to follow me on twitter >:)"
];

respawn_time  = room_speed * .8;
respawn_timer = 0;

level = 0;
level_clear_message = false;
level_clear_time = room_speed * 2.8

draw_set_font(fnt_good);