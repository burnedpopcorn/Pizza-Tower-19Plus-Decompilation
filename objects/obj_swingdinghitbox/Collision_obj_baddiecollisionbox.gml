with (other.id)
{
    if (instance_exists(baddieID) && baddieID.state != 107)
    {
        instance_create_depth(baddieID.x, baddieID.y, -1, obj_genericpoofeffect)
        do_hitstun(global.otherimpactfulhitstun)
        instance_destroy()
        instance_destroy(baddieID)
    }
}
