unalteredx -= 4
with (obj_drawcontroller)
    self.update_camera()
x = unalteredx + camera_get_view_x(view_camera[1]) * 0.85
y = ystart + camera_get_view_y(view_camera[1]) * 0.85
if (x < -200)
    instance_destroy()
