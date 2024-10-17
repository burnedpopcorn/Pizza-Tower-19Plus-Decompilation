if (other.grabbedby == -4 && abs(other.hsp) > 0 && (!other.dead))
{
    with (obj_player)
        do_hitstun(global.mach2hitstun)
    gamepadvibrate(1, 0, 10)
    sprite_index = spr_cheesedragon_hurt
    image_index = 0
    ds_list_add(global.saveroom, id)
    other.dead = true
    scr_fmod_soundeffectONESHOT("event:/sfx/enemy/punched", x, y)
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/dragonhurt", x, y)
    instance_destroy(obj_dragonflame)
    instance_destroy(obj_dragonbrick)
    instance_destroy(obj_giantfireball)
    instance_destroy(flamehitbox)
}
