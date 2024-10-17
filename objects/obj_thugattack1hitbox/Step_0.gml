if ((!instance_exists(baddieID)) || baddieID.sprite_index != spr_thug_attack1 || (!((image_index >= 8 && image_index < 13))))
    instance_destroy()
if instance_exists(baddieID)
{
    image_xscale = baddieID.image_xscale
    x = baddieID.x
    y = baddieID.y
}
