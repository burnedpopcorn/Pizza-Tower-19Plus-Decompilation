if (sprite_index == spr_brick1falling || sprite_index == spr_brick2falling)
{
    var plrid = other.playerid
    with (plrid)
        parry()
    instance_destroy()
}
