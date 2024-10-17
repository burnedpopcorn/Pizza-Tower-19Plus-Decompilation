if (global.currentpowerup != (1 << 0) && is_player_grabbing(other.id))
{
    global.currentpowerup = (1 << 0)
    other.state = (24 << 0)
    other.image_index = 0
    other.sprite_index = other.spr_shotgunpullout
    scr_fmod_soundeffectONESHOT("event:/sfx/player/collect/shotgun", x, y)
    instance_destroy()
}
