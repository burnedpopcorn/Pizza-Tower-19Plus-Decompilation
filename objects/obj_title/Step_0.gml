if (!done)
{
    vsp += 0.5
    y += vsp
}
if (y >= -32)
{
    if (vsp >= 0)
    {
        if (vsp > 2)
        {
            camera_shake(vsp, 40)
            vsp = round((-vsp) / 2)
            scr_fmod_soundeffectONESHOT("event:/sfx/misc/titlelogoland", x, (y + 200))
            gamepadvibrate(0.9, 0, 10)
        }
        else if (!done)
        {
            done = true
            vsp = 0
            y = -32
        }
        if (!land)
        {
            land = true
            scr_fmod_soundeffectONESHOT("event:/sfx/misc/titlelogofall", x, (y + 200))
            with (obj_player)
            {
                sprite_index = spr_player_titlescared
                image_index = 0
                state = (31 << 0)
                vsp = -5
            }
        }
    }
}
if done
{
    wavespd += (-0.2 * (dcos(image_angle - 90)))
    image_angle += wavespd
    wavespd *= 0.99
}
