repeat (6)
{
    with (instance_create_depth((x - 32 * image_xscale + (random_range(-25, 25))), (y + (random_range(-25, 25))), 0, obj_balloonpop))
        sprite_index = spr_shotgunimpact
}
with (instance_create_depth(x, y, 0, obj_baddiedead))
    sprite_index = spr_peppinobullet_dead
