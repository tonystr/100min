
x += spd * dir;

if (bbox_left > room_width + 50 || bbox_right < -50) instance_destroy();

if (sprite_index == spr_turtle) image_xscale = dir;