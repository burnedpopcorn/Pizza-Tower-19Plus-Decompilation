draw_set_color(c_white)
draw_set_alpha(fadealpha)
draw_rectangle(camera_get_view_x(view_camera[1]), camera_get_view_y(view_camera[1]), (camera_get_view_x(view_camera[1]) + camera_get_view_width(view_camera[1])), (camera_get_view_y(view_camera[1]) + camera_get_view_height(view_camera[1])), 0)
draw_set_alpha(1)
