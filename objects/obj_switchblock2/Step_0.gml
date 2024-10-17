visible = 1
if global.switchblock
{
    alpha = 0.5
    mask_index = spr_masknull
    sprite_index = spr_switchblock_sleep
}
else if (!global.switchblock)
{
    alpha = 1
    mask_index = sprite_index
    sprite_index = spr_switchblock_awake
}
