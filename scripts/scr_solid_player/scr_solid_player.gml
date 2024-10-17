function scr_solid_player(argument0, argument1) //scr_solid_player
{
    static il = global.instancelist

    var old_x = x
    var old_y = y
    x = argument0
    y = argument1
    var collisioncheck = [obj_solid, obj_slope, noone, noone, noone, noone]
    if (y > old_y && state != (37 << 0))
    {
        collisioncheck[2] = obj_platform
        if (state == (66 << 0) || sprite_index == spr_machslideboost3 || sprite_index == spr_machslideboost3end)
            collisioncheck[3] = obj_infestedwater
    }
    if (state == (27 << 0))
    {
        collisioncheck[4] = obj_grindrailslope
        if (y > old_y)
            collisioncheck[5] = obj_grindrail
    }
    var num = instance_place_list(x, y, collisioncheck, il, true)
    var _collided = false
    for (var i = 0; i < num; i++)
    {
        var b = ds_list_find_value(il, i)
        var obj = b.object_index
        if (object_is_parent_or_ancestor(obj_platform, obj) || object_is_parent_or_ancestor(obj_infestedwater, obj) || object_is_parent_or_ancestor(obj_grindrail, obj))
            _collided = (!(place_meeting(x, old_y, b)))
        else if (object_is_parent_or_ancestor(obj_slope, obj) || object_is_parent_or_ancestor(obj_grindrailslope, obj))
        {
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
                var s = slope_start - (round(m * (object_side - bbox_left)))
                if (other.bbox_bottom >= s)
                    _collided = true
            }
        }
        else
            _collided = true
        if _collided
        {
            ds_list_clear(il)
            x = old_x
            y = old_y
            return 1;
        }
    }
    ds_list_clear(il)
    x = old_x
    y = old_y
    return 0;
}

function check_slope_player(argument0, argument1, argument2) //check_slope_player
{
    if (argument1 == undefined)
        argument1 = x
    if (argument2 == undefined)
        argument2 = y
    if (!(place_meeting(x, y, argument0)))
        return;
    var il = global.instancelist
    var num = instance_place_list(argument1, argument2, argument0, il, true)
    for (var i = 0; i < num; i++)
    {
        var slope = ds_list_find_value(il, i)
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
            {
                ds_list_clear(il)
                return 1;
            }
        }
    }
    ds_list_clear(il)
    return 0;
}

