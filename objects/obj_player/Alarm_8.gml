if (state == (50 << 0))
{
    if global.smallpep
        state = (106 << 0)
    else if (mask_index == spr_crouchmask)
        state = (43 << 0)
    else
        state = (0 << 0)
    movespeed = 0
}
