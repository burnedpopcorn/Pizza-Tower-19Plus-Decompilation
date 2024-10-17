if (magnetized == noone)
    visible = (!(place_meeting(x, y, [obj_destructibles, obj_metalblock])))
else
    visible = true
if (global.collectsound < 10)
    global.collectsound += 1
if (area != noone)
{
    if (area.activate == 1)
        activate = 1
}
if (activate == 0)
{
    image_alpha = 0
    mask_index = spr_masknull
}
if (activate == 1)
{
    if (image_alpha < 1)
        image_alpha += 0.05
    mask_index = spr_sausagecollect
    if (magnetized == noone)
    {
        with (instance_nearest((x + 16), (y + 16), obj_player))
        {
            if (distance_to_point((other.x + 16), (other.y + 16)) <= 48)
                other.magnetized = id
        }
    }
    else
    {
        x = lerp(x, (magnetized.x - 16), 0.2)
        y = lerp(y, magnetized.y, 0.2)
    }
    ds_list_add(global.collectspawn, id)
}
