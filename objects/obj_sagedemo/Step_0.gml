if obj_title.done
{
    wavespd += (-0.2 * (dcos(image_angle - 90)))
    image_angle += wavespd
    if (!playerhit)
    {
        wavespd *= 0.98
        if (!playedsnd)
        {
            playedsnd = true
            scr_fmod_soundeffectONESHOT("event:/sfx/misc/secondlogoswingin", x, (y + (lengthdir_y(200, (image_angle - 90)))))
        }
        if (sign(wavespd) == 1 && (!playedothersnd))
        {
            playedothersnd = true
            scr_fmod_soundeffectONESHOT("event:/sfx/misc/secondlogoswingout", x, (y + (lengthdir_y(200, (image_angle - 90)))))
        }
    }
    else
        wavespd *= 0.99
}
