if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create_depth(x, y, 0, obj_baddiedead))
        sprite_index = spr_fleshmetalbdead
    camera_shake(20, 40)
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/metalbreak", x, y)
    ds_list_add(global.saveroom, id)
}
delete_covered_tiles()
destroy_clips()
