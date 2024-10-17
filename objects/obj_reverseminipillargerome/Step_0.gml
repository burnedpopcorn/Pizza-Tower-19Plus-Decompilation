visible = 1
if (array_get_index(global.followers, obj_gerome) == -1)
{
    mask_index = spr_geromeblockwoke
    image_alpha = 1
}
else
{
    mask_index = spr_masknull
    sprite_index = spr_geromeblocksleep
    image_alpha = 0.6
}
