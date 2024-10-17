visible = (!global.timetrial)
if visible
{
    var _area = instance_place(x, y, obj_gatetoppinarea)
    if (obj_player.state == (31 << 0) && obj_player.sprite_index == obj_player.spr_taunt)
    {
        if (sprite_index != tauntspr)
        {
            sprite_index = tauntspr
            image_index = irandom(2)
            with (instance_create_depth(x, y, (depth + 1), obj_taunteffect))
                sprite_index = spr_tinytaunt
        }
    }
    else
    {
        statetime--
        if (statetime <= 0)
        {
            statetime = irandom_range(50, 150)
            running = (!running)
            if running
                image_xscale = choose(-1, 1)
        }
        if running
        {
            sprite_index = runspr
            var _prevx = x
            x += (2 * image_xscale)
            if (_area == noone || rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, _area.bbox_left, _area.bbox_top, _area.bbox_right, _area.bbox_bottom) != 1)
            {
                image_xscale *= -1
                x = _prevx
                x += (2 * image_xscale)
            }
        }
        else
            sprite_index = idlespr
    }
    if (_area != noone && bbox_in_camera(1, id, 100))
        y += ((fast_ray(bbox_left, _area.bbox_top, bbox_right, _area.bbox_bottom)) - bbox_bottom)
}
