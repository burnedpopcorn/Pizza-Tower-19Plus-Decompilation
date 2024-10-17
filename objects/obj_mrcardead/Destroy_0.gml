instance_create_depth(x, y, 0, obj_bombexplosion2)
scr_fmod_soundeffectONESHOT("event:/sfx/misc/mrcarexplode", x, y)
destroy_sounds([spinsound])
with (obj_player)
{
    givepoints = 1
    givepointamount = 30
    givepointmultiplier = 2
}
