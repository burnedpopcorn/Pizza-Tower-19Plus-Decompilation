if (ds_list_find_index(global.saveroom, string("{0}_open", id)) != -1)
{
    sprite_index = spr_weaponmachine_used
    mask_index = spr_masknull
}
if (ds_list_find_index(global.saveroom, string("{0}_noshield", id)) != -1)
{
    instance_destroy(shield)
    shield = -4
}
