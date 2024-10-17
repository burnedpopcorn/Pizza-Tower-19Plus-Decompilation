if (godown && (!instance_exists(obj_fadeout)))
{
    if (y > room_height)
        instance_create_depth(x, y, -9999, obj_fadeout)
    y += 4
}
if (sprite_index == spr_elevatorclose && floor(image_index) == (image_number - 1))
    sprite_index = spr_elevatorclosed
