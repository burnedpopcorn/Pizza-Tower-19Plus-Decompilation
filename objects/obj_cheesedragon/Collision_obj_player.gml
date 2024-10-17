if (sprite_index != spr_cheesedragon_goingup)
{
    with (other.id)
    {
        state = (49 << 0)
        sprite_index = spr_bump
        xscale = other.image_xscale
        hsp = -5 * xscale
        vsp = -5
        scr_fmod_soundeffectONESHOT("event:/sfx/player/bump", x, y)
        gamepadvibrate(0.4, 0, 7)
        image_index = 0
    }
}
