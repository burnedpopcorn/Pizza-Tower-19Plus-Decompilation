var _gate = instance_place(x, y, obj_startgate)
if (_gate == noone)
{
    instance_destroy()
    return;
}
for (var i = 0; i < array_length(spr); i++)
{
    var _got = false
    save_open()
    if ini_read_real("Toppins", string_concat(_gate.level, (i + 1)), false)
        _got = true
    save_close()
    if (!_got)
    {
    }
    else
    {
        var _idlespr = spr[i]
        var _name = sprite_get_name(spr[i])
        var _runspr = asset_get_index(_name + "_run")
        var _tauntspr = asset_get_index(_name + "_taunt")
        var _x = irandom_range((bbox_left + 32), (bbox_right - 32))
        with (instance_create_depth(_x, bbox_top, -2, obj_gatetoppin))
        {
            idlespr = _idlespr
            runspr = _runspr
            tauntspr = _tauntspr
            y += ((fast_ray(bbox_left, other.bbox_top, bbox_right, other.bbox_bottom)) - bbox_bottom)
        }
    }
}
