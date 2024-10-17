if (sprite_index == spr_grabbiehand_fall)
{
    with (other.id)
    {
        if (state == (11 << 0))
        {
            scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/detransfo", x, y)
            with (instance_create_depth(x, y, -1, obj_boxxeddebris))
                image_index = 0
            with (instance_create_depth(x, y, -1, obj_boxxeddebris))
                image_index = 1
            with (instance_create_depth(x, y, -1, obj_boxxeddebris))
                image_index = 2
            with (instance_create_depth(x, y, -1, obj_boxxeddebris))
                image_index = 3
            with (instance_create_depth(x, y, -1, obj_boxxeddebris))
                image_index = 4
        }
        if (state == (9 << 0) || state == (10 << 0))
        {
            scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/detransfo", x, y)
            instance_create_depth(x, y, -1, obj_slimedebris)
            instance_create_depth(x, y, -1, obj_slimedebris)
            instance_create_depth(x, y, -1, obj_slimedebris)
            instance_create_depth(x, y, -1, obj_slimedebris)
            instance_create_depth(x, y, -1, obj_slimedebris)
            instance_create_depth(x, y, -1, obj_slimedebris)
            instance_create_depth(x, y, -1, obj_slimedebris)
            instance_create_depth(x, y, -1, obj_slimedebris)
        }
    }
    grav = 0
    vsp = 0
    grabbing = 1
    sprite_index = spr_grabbiehand_catch
    other.image_index = 0
    other.sprite_index = spr_player_catched
    other.state = (49 << 0)
    other.x = x
    other.y = y
    other.vsp = 0
    other.hsp = 0
    scr_fmod_soundeffectONESHOT("event:/sfx/enemy/hit", x, y)
}
if (other.state == (16 << 0) && thumbingup == 0 && x <= (xstarte + 5) && x >= (xstarte - 5) && y <= (ystarte + 5) && y >= (ystarte - 5) && grabbing == 0)
{
    scr_fmod_soundeffectONESHOT("event:/sfx/enemy/hit", x, y)
    delay = 5
    image_xscale = (-other.xscale)
    thumbingup = 1
    instance_create_depth(x, y, 0, obj_bangeffect)
    sprite_index = spr_grabbiehand_hifive
    image_index = 0
}
