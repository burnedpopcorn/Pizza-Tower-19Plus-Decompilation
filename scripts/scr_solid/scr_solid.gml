function scr_solid(argument0, argument1) //scr_solid
{
    static il = global.instancelist

    var old_x = x
    var old_y = y
    x = argument0
    y = argument1
    var collisioncheck = [obj_solid, obj_slope]
    if (y > old_y)
        array_push(collisioncheck, obj_platform)
    if array_length(collisioncheck)
    {
        var num = instance_place_list(x, y, collisioncheck, il, true)
        var _collided = false
        for (var i = 0; i < num; i++)
        {
            var b = ds_list_find_value(il, i)
            switch b.object_index
            {
                case obj_platform:
                    if (!(place_meeting(x, old_y, b)))
                        _collided = true
                    break
                case obj_slope:
                case obj_ramp:
                    with (b)
                    {
                        var object_side = 0
                        var slope_start = 0
                        var slope_end = 0
                        if (image_xscale > 0)
                        {
                            object_side = other.bbox_right
                            slope_start = bbox_bottom
                            slope_end = bbox_top
                        }
                        else
                        {
                            object_side = other.bbox_left
                            slope_start = bbox_top
                            slope_end = bbox_bottom
                        }
                        var m = sign(image_xscale) * (bbox_bottom - bbox_top) / (bbox_right - bbox_left)
                        b = slope_start - (round(m * (object_side - bbox_left)))
                        if (other.bbox_bottom >= b)
                            _collided = true
                    }
                    break
                default:
                    _collided = true
            }

            if _collided
            {
                ds_list_clear(il)
                x = old_x
                y = old_y
                return 1;
            }
        }
        ds_list_clear(il)
    }
    x = old_x
    y = old_y
    return 0;
}

function scr_solid_exclude_destructibles(argument0, argument1) //scr_solid_exclude_destructibles
{
    static il = global.instancelist

    var old_x = x
    var old_y = y
    x = argument0
    y = argument1
    var collisioncheck = [obj_solid, obj_slope]
    if (y > old_y)
        array_push(collisioncheck, obj_platform)
    if array_length(collisioncheck)
    {
        var num = instance_place_list(x, y, collisioncheck, il, true)
        var _collided = false
        for (var i = 0; i < num; i++)
        {
            var b = ds_list_find_value(il, i)
            switch b.object_index
            {
                case obj_platform:
                    if (!(place_meeting(x, old_y, b)))
                        _collided = true
                    break
                case obj_slope:
                case obj_ramp:
                    with (b)
                    {
                        var object_side = 0
                        var slope_start = 0
                        var slope_end = 0
                        if (image_xscale > 0)
                        {
                            object_side = other.bbox_right
                            slope_start = bbox_bottom
                            slope_end = bbox_top
                        }
                        else
                        {
                            object_side = other.bbox_left
                            slope_start = bbox_top
                            slope_end = bbox_bottom
                        }
                        var m = sign(image_xscale) * (bbox_bottom - bbox_top) / (bbox_right - bbox_left)
                        b = slope_start - (round(m * (object_side - bbox_left)))
                        if (other.bbox_bottom >= b)
                            _collided = true
                    }
                    break
                case obj_solid:
                    _collided = true
                    break
            }

            if _collided
            {
                ds_list_clear(il)
                x = old_x
                y = old_y
                return true;
            }
        }
        ds_list_clear(il)
    }
    x = old_x
    y = old_y
    return false;
}

function check_slope(argument0) //check_slope
{
    var slope = instance_place(x, y, argument0)
    if slope
    {
        with (slope)
        {
            var object_side = 0
            var slope_start = 0
            var slope_end = 0
            if (image_xscale > 0)
            {
                object_side = other.bbox_right
                slope_start = bbox_bottom
                slope_end = bbox_top
            }
            else
            {
                object_side = other.bbox_left
                slope_start = bbox_top
                slope_end = bbox_bottom
            }
            var m = sign(image_xscale) * (bbox_bottom - bbox_top) / (bbox_right - bbox_left)
            slope = slope_start - (round(m * (object_side - bbox_left)))
            if (other.bbox_bottom >= slope)
                return 1;
        }
    }
    return 0;
}

