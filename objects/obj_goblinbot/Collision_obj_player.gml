with (other.id)
{
    if (state != (18 << 0) && state != (13 << 0) && state != (78 << 0))
    {
        if (state != (1 << 0))
        {
            state = (1 << 0)
            voice_transfo()
            scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/transfo", x, y)
        }
        if (movespeed < 14 || xscale != other.image_xscale)
            movespeed = 14
        xscale = other.image_xscale
        vsp = 0
        sprite_index = spr_tumble
        y = other.y
        if (other.sprite_index != spr_goblinbot_kick)
        {
            other.sprite_index = spr_goblinbot_kick
            other.image_index = 0
            scr_fmod_soundeffectONESHOT("event:/sfx/player/spring", other.x, other.y)
        }
    }
}
