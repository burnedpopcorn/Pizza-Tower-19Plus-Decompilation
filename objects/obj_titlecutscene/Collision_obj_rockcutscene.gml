if (other.image_index == 0)
{
    event_stop_description("event:/sfx/misc/taxidrive", true)
    scr_fmod_soundeffectONESHOT("event:/sfx/player/hurt", x, y)
    stop_music()
    instance_create_depth(x, y, 0, obj_bangeffect)
    if instance_exists(obj_superdashcloud)
        instance_destroy(obj_superdashcloud)
    sprite_index = spr_player_firemoveend
    drop = 1
    vsp = -16
    hsp = 18
    camera_shake(5, 15)
    gamepadvibrate(0.6, 0, 7)
    other.image_index = 1
}
