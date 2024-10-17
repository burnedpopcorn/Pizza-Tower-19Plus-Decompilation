if instance_exists(ID)
{
    if (ID.hsp != 0)
        image_xscale = sign(ID.hsp)
    else
        image_xscale = 0
    if (ID.sprite_index != ID.spr_dead)
        instance_destroy()
    x = ID.x
    y = ID.y
}
