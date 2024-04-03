// Eased camera movement.

if follow != noone {
	x_to = follow.x;
	y_to = follow.y;
}

x += (x_to - x)/15;
y += (y_to - y)/5;

camera_set_view_pos(view_camera[0], x-(width*0.5), y-(height*0.5));