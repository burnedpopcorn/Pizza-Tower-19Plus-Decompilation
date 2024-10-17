with (instance_create_depth(x, y, depth, obj_bigdoughblockspawner))
{
    isrespawning = 1
    alarm[0] = 100
}
with (instance_create_depth(x, y, 0, obj_baddiedead))
    sprite_index = spr_bigdoughblockdead
instance_create_depth((x + 16), (y + 16), -2, obj_genericpoofeffect)
scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
scr_fmod_soundeffectONESHOT("event:/sfx/player/killingblow", x, y)
