shakex = Approach(shakex, 0, 0.5)
if side
{
    if (!global.panic)
    {
        if bothered
            sprite_index = spr_backgroundpillarside_bothered
        else
            sprite_index = spr_backgroundpillarside_idle
    }
    else
        sprite_index = spr_backgroundpillarside_panic
}
else if (!global.panic)
{
    if bothered
        sprite_index = spr_backgroundpillar_bothered
    else
        sprite_index = spr_backgroundpillar_idle
}
else
    sprite_index = spr_backgroundpillar_panic
x = xstart + (random_range((-shakex), shakex))
