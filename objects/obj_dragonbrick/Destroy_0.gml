repeat (6)
{
    with (instance_create_depth(x, y, -1, obj_debris))
        sprite_index = spr_brickdebris
}
scr_fmod_soundeffectONESHOT("event:/sfx/misc/brickbreak", x, y)
