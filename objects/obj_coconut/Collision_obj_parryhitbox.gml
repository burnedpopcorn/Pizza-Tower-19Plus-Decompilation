if (!parried)
{
    var plrid = other.playerid
    with (plrid)
        parry()
    parried = true
    image_xscale *= -1
}
