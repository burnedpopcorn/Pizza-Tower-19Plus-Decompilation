if ((!cutscene) && other.grounded == 1 && state != (19 << 0) && (is_player_grabbing() || (state == (0 << 0) && character == "S")))
{
    bombpeptimer = 100
    state = (19 << 0)
    image_index = 0
    sprite_index = spr_bombpepintro
    bombspawnerid = other.spawner
    instance_destroy(other.id)
    restore_combo()
    voice_transfo()
    scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/transfo", x, y)
}
if ((!cutscene) && other.grounded && state != (19 << 0) && state == (53 << 0))
{
    instance_create_depth(x, y, 0, obj_bombexplosion)
    instance_destroy(other.id, false)
    scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/bombpepexplode", x, y)
    scr_fmod_soundeffectONESHOT("event:/sfx/player/mach/superjumprelease", x, y)
    instance_create_depth(x, y, 0, obj_bangeffect)
    sprite_index = spr_player_bombjump
    state = (40 << 0)
    vsp = -20
    cancel_Sjump = false
}
