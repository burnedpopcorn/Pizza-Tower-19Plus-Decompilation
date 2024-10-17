if (yoffset > -32)
    yoffset--
x = camera_get_view_x(view_camera[1]) + xoffset + wavex
y = camera_get_view_y(view_camera[1]) + yoffset
if (yoffset <= -32)
    instance_destroy()
