if (falling && vsp > 0)
{
    instance_create_depth(x, y, 0, obj_stompeffect)
    scr_fmod_soundeffectONESHOT("event:/sfx/player/hurt", x, y)
    scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
    with (obj_player)
    {
        image_index = 0
        state = (21 << 0)
        sprite_index = spr_stunned
    }
    vsp = -5
    hsp = 5
    camera_shake(10, 30)
}
