with (other.id)
{
    if (!instance_exists(obj_fadeout))
    {
        if (other.doorletterid != noone)
        {
            obj_player.verticalhallwayposition = point_distance(obj_player.x, other.doorletterid.y, other.doorletterid.x, other.doorletterid.y)
            obj_player.verticalhallway = 1
            obj_player.verticalflip = sign(other.image_yscale)
            if (obj_player.x > other.doorletterid.x)
                obj_player.verticalhallwayside = 1
            else if (obj_player.x < other.doorletterid.x)
                obj_player.verticalhallwayside = -1
            obj_player.targetDoor = other.targetDoor
            obj_player.targetRoom = other.targetRoom
            other.visited = 1
            image_index = 0
            instance_create_depth(x, y, -9999, obj_fadeout)
            event_play_oneshot("event:/sfx/player/doorenter")
            var _hally = (sign(image_yscale) == -1 ? bbox_top : (bbox_bottom - 32))
            y = _hally + 16
        }
    }
}
