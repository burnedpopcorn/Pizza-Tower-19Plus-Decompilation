visible = 1
if (!there_is_follower_obj(obj_gerome))
{
    mask_index = spr_masknull
    image_alpha = 0.6
}
else
{
    mask_index = spr_geromeblockwoke
    sprite_index = spr_geromeblockwoke
    image_alpha = 1
}
