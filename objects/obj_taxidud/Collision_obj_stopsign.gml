if (playerid.visible == 0)
{
    with (playerid)
    {
        event_play_oneshot("event:/sfx/misc/taxihonk")
        state = (0 << 0)
        visible = 1
        cutscene = 0
    }
}
