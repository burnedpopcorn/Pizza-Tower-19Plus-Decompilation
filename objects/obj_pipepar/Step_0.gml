if (floor(image_index) >= 20 && sprite_index == pipeenterspr && (!released))
{
    if place_meeting(x, y, obj_player)
    {
        released = 1
        alarm[0] = 30
        with (obj_player)
        {
            if (pipe == other.id && pipedir == "hold")
            {
                pipedir = other.pipedir
                pipe = -4
            }
        }
    }
}
if (floor(image_index) == (image_number - 1) && sprite_index == pipeenterspr)
    sprite_index = pipespr
