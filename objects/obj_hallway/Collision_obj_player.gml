with (other.id)
{
    x = other.x
    if (!instance_exists(obj_fadeout))
    {
        obj_player.targetDoor = other.targetDoor
        obj_player.targetRoom = other.targetRoom
        obj_player.hallway = 1
        obj_player.hallwaydirection = other.image_xscale
        other.visited = 1
        image_index = 0
        event_play_oneshot("event:/sfx/player/doorenter")
        instance_create_depth(x, y, -9999, obj_fadeout)
    }
}
