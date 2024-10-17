with (other.id)
{
    x = other.x
    y = other.y + other.sprite_height - 46
    hsp = 0
    vsp = 0
    if (!instance_exists(obj_fadeout))
    {
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        state = (54 << 0)
        other.visited = 1
        image_index = 0
        event_play_oneshot("event:/sfx/player/doorenter")
        instance_create_depth(x, y, -9999, obj_fadeout)
    }
}
