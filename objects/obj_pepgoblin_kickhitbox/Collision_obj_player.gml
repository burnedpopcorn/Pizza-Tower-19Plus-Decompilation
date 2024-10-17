with (other.id)
{
    if (instance_exists(other.baddieID) && state != (1 << 0) && sprite_index != spr_tumbleend && state != (18 << 0) && state != (13 << 0) && state != (31 << 0) && state != (70 << 0) && state != (41 << 0) && state != (54 << 0))
    {
        state = (1 << 0)
        xscale = other.baddieID.image_xscale
        movespeed = 12
        vsp = 0
        sprite_index = spr_tumble
        voice_transfo()
        scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/transfo", x, y)
    }
}
