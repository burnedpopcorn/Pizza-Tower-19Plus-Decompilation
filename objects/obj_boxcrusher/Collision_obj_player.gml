if (sprite_index == spr_boxcrusher_fall)
{
    with (other.id)
    {
        image_index = 0
        state = (49 << 0)
        x = other.x
        y = other.y
    }
}
if (sprite_index == spr_boxcrusher_land)
{
    with (other.id)
    {
        if (grounded && state != (11 << 0))
        {
            state = (11 << 0)
            x = other.x
            y = other.y - 20
            sprite_index = spr_boxxedintro
            image_index = 0
            voice_transfo()
            scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/transfo", x, y)
            hsp = 0
            vsp = 0
        }
    }
}
