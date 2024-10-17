with (other.id)
{
    if (grounded && (!rocket))
    {
        xscale = other.image_xscale
        machhitAnim = 0
        state = (66 << 0)
        sprite_index = spr_rocketstart
        image_index = 0
        voice_transfo()
        scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/transfo", x, y)
        rocket = 1
    }
}
