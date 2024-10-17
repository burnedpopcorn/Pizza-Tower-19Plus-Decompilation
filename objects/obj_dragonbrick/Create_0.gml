depth = -6
alarm[0] = 180
sprite_index = choose(spr_brick1readytofall, spr_brick2readytofall)
image_speed = 0.175
yoffset = -32
xoffset = irandom(camera_get_view_width(view_camera[1]))
x = camera_get_view_x(view_camera[1]) + xoffset
y = camera_get_view_y(view_camera[1]) + yoffset
inwall = false
waveamount = 4
wavespd = 2
while place_meeting(x, y, obj_dragonbrick)
{
    xoffset = irandom(camera_get_view_width(view_camera[1]))
    x = camera_get_view_x(view_camera[1]) + xoffset
}
