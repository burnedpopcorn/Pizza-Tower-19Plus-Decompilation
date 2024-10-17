if (magnetized == noone)
    visible = (!(place_meeting(x, y, [obj_destructibles, obj_metalblock])))
else
    visible = true
if global.panic
{
    if ((!(place_meeting(x, y, obj_destructibles))) && (!(place_meeting(x, y, obj_targetblock))))
    {
        if (magnetized == noone)
        {
            with (instance_nearest((x + 16), (y + 16), obj_player))
            {
                if (distance_to_point((other.x + 16), (other.y + 16)) <= 48)
                    other.magnetized = id
            }
        }
    }
    if (magnetized != noone)
    {
        var _dir = point_direction(x, y, magnetized.x, magnetized.y)
        x += lengthdir_x(magnetspeed, _dir)
        y += lengthdir_y(magnetspeed, _dir)
        magnetspeed++
    }
}
if (!global.panic)
{
    image_alpha = 0.5
    mask_index = spr_masknull
}
if global.panic
{
    image_alpha = 1
    mask_index = spr_sausagecollect
}
if (global.collectsound < 10)
    global.collectsound += 1
