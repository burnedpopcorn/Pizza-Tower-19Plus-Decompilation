if instance_exists(obj_player)
{
    if (obj_player.state == (110 << 0) && room == TitlescreenRoom)
    {
        obj_player.state = (0 << 0)
        input_clear_momentary(true)
    }
}
