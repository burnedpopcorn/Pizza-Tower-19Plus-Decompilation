if (!parried)
{
    parried = 1
    with (other.playerid)
        parry()
    image_xscale = (-image_xscale)
    alarm_set(0, 10)
}
