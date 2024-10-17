if (state != 107)
{
    sprite_index = stunfallspr
    instance_destroy()
    var explosiontime = 1
    explosiontime -= 1
    if (explosiontime <= 0 && hp <= 0)
        instance_create_depth(x, y, -1, obj_genericpoofeffect)
    var hitstun = 1
    flash = 1
    scr_enemygibs()
    scr_fmod_soundeffectONESHOT("event:/sfx/enemy/punched", x, y)
    thrown = 1
    state = 104
    stunned = 100
    vsp = -8
    hsp = other.image_xscale * 12
    instance_destroy(other.id)
    hitstun -= 1
    with (obj_player)
    {
        do_hitstun(global.otherimpactfulhitstun)
        camera_shake(3, 3)
        with (obj_drawcontroller)
            alarm[3] = 15
    }
}
