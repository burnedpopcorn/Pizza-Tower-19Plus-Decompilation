if (yoffset < 17)
    yoffset++
if (sprite_index == spr_brick1readytofall || sprite_index == spr_brick2readytofall)
{
    x = camera_get_view_x(view_camera[1]) + xoffset + (wave(waveamount, (-waveamount), wavespd, 0))
    y = camera_get_view_y(view_camera[1]) + yoffset
    inwall = scr_solid(x, y)
}
else
{
    if (y > (camera_get_view_y(view_camera[1]) + camera_get_view_height(view_camera[1]) + 64))
        instance_destroy(id, false)
    if ((!(scr_solid(x, y))) && inwall)
        inwall = false
    repeat (5)
    {
        y++
        if (scr_solid(x, (y + 1)) && (!inwall))
            instance_destroy()
    }
}
