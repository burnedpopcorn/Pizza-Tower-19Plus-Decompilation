with (other.id)
{
    if (!instance_exists(obj_fadeout))
    {
        if (other.doorletterid != noone)
        {
            backtohubstartx = obj_doorB.x + 16
            backtohubstarty = obj_doorB.y - 14
            backtohubroom = room
            verticalhallwayposition = point_distance(x, other.doorletterid.y, other.doorletterid.x, other.doorletterid.y)
            verticalhallway = 1
            verticalflip = other.image_yscale
            if (x > other.doorletterid.x)
                verticalhallwayside = 1
            else if (x < other.doorletterid.x)
                verticalhallwayside = -1
            targetDoor = other.targetDoor
            targetRoom = other.targetRoom
            global.levelname = "tutorial"
            instance_create_depth(x, y, -9999, obj_fadeout)
            event_play_oneshot("event:/sfx/player/doorenter")
            y = other.y + 16
        }
    }
}
