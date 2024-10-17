if (sprite_index != spr_shotgunbulletdown)
{
    repeat (6)
    {
        with (instance_create_depth((x + (random_range(-25, 25))), (y + (random_range(-25, 25))), 0, obj_balloonpop))
            sprite_index = spr_shotgunimpact
    }
}
else
{
    repeat (6)
    {
        with (instance_create_depth((x - 32 * image_xscale + (random_range(-25, 25))), (y + (random_range(-25, 25))), 0, obj_balloonpop))
            sprite_index = spr_shotgunimpact
    }
}
