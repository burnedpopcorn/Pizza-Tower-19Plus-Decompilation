with (obj_player)
{
    if (state == (66 << 0))
    {
        do_hitstun(global.mach3hitstun)
        gamepadvibrate(1, 0, 15)
    }
    else
    {
        do_hitstun(global.mach2hitstun)
        gamepadvibrate(0.7, 0, 7)
    }
}
with (instance_create_depth(x, y, depth, obj_frozenjohn))
    image_xscale = other.image_xscale
scr_fmod_soundeffectONESHOT("event:/sfx/enemy/punched", (obj_player.x + obj_player.xscale * 32), obj_player.y)
ds_list_add(global.saveroom, id)
