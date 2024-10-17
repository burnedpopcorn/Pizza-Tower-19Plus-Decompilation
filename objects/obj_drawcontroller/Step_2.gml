self.update_camera((obj_pause.pause && (!copyapp)))
with (obj_dragonbrick)
{
    if (sprite_index == spr_brick1readytofall || sprite_index == spr_brick2readytofall)
    {
        x = camera_get_view_x(view_camera[0]) + xoffset + (wave(waveamount, (-waveamount), wavespd, 0))
        y = camera_get_view_y(view_camera[0]) + (get_game_height() - 540) / 2 + yoffset
        inwall = scr_solid(x, y)
    }
}
with (obj_dragonbrickhand)
{
    x = camera_get_view_x(view_camera[0]) + xoffset + wavex
    y = camera_get_view_y(view_camera[0]) + (get_game_height() - 540) / 2 + yoffset
}
