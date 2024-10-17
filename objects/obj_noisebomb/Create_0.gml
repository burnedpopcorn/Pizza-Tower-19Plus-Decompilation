image_speed = 0.35
followQueue = ds_queue_create()
hsp = 0
vsp = 0
grav = 0.23
movespeed = 3
with (obj_player)
{
    state = (31 << 0)
    sprite_index = spr_bossintro
    image_index = 0
    scr_fmod_soundeffectONESHOT("event:/sfx/enemy/scream", x, y)
}
sprite_index = spr_noisebomb_intro
instance_create_depth(x, y, 1, obj_taunteffect)
