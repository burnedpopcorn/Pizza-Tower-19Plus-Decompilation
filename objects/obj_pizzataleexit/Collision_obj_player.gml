with (other.id)
{
    if (!instance_exists(obj_fadeout))
    {
        obj_player.targetDoor = other.targetDoor
        obj_player.targetRoom = pizzataleroom
        other.visited = 1
        image_index = 0
        instance_create_depth(x, y, -9999, obj_fadeout)
        event_play_oneshot("event:/sfx/player/doorenter")
    }
}
