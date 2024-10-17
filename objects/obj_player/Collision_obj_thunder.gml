if (sprite_index != spr_knightpepthunder)
{
    sprite_index = spr_knightpepthunder
    scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/knightthunder", x, y)
    voice_transfo()
    scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/transfo", x, y)
}
instance_destroy(other.id)
image_index = 0
camera_shake(10, 30)
