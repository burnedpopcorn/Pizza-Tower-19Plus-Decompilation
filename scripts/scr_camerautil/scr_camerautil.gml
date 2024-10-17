function camera_zoom(argument0, argument1) //camera_zoom
{
    if (argument1 == undefined)
        argument1 = noone
    with (obj_drawcontroller)
    {
        targetzoom = argument0
        targetzoom = clamp(targetzoom, 0, max_zoom)
        if (argument1 != noone)
            zoomspd = abs(argument1)
    }
}

function camera_set_zoom(argument0) //camera_set_zoom
{
    with (obj_drawcontroller)
        zoom = argument0
}

function bbox_in_camera(argument0, argument1, argument2) //bbox_in_camera
{
    if (argument2 == undefined)
        argument2 = 0
    var camx = camera_get_view_x(view_camera[argument0])
    var camy = camera_get_view_y(view_camera[argument0])
    var camw = camera_get_view_width(view_camera[argument0])
    var camh = camera_get_view_height(view_camera[argument0])
    return rectangle_in_rectangle(argument1.bbox_left, argument1.bbox_top, argument1.bbox_right, argument1.bbox_bottom, (camx - argument2), (camy - argument2), (camx + camw + argument2), (camy + camh + argument2));
}

function camera_shake(argument0, argument1) //camera_shake
{
    with (obj_drawcontroller)
    {
        if global.camerashake
        {
            shake_mag = argument0
            shake_mag_acc = argument1 / room_speed
        }
    }
}

