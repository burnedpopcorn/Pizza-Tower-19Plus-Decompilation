function raycast(argument0, argument1, argument2, argument3, argument4) //raycast
{
    var _x = argument[0]
    var _y = argument[1]
    var _dir = argument[2]
    var _range = argument[3]
    var _objToCollide = argument[4]
    var _list = ds_map_create()
    ds_map_add(_list, "distance", _range)
    ds_map_add(_list, "x", (_x + (lengthdir_x(_range, _dir))))
    ds_map_add(_list, "y", (_y + (lengthdir_y(_range, _dir))))
    ds_map_add(_list, "x_origin", _x)
    ds_map_add(_list, "y_origin", _y)
    var _col = collision_line(_x, _y, (_x + (lengthdir_x(_range, _dir))), (_y + (lengthdir_y(_range, _dir))), _objToCollide, true, true)
    if _col
    {
        var _xA = 0
        var _yA = 0
        var _rangeCount = 1
        while ((!(collision_line(_x, _y, (_x + _xA), (_y + _yA), _objToCollide, true, true))) && _rangeCount < _range)
        {
            _xA = lengthdir_x(_rangeCount, _dir)
            _yA = lengthdir_y(_rangeCount, _dir)
            _rangeCount++
        }
        ds_map_replace(_list, "distance", _rangeCount)
        ds_map_replace(_list, "x", (_x + _xA))
        ds_map_replace(_list, "y", (_y + _yA))
        ds_map_replace(_list, "x_origin", _x)
        ds_map_replace(_list, "y_origin", _y)
        _col = collision_line(_x, _y, (_x + _xA), (_y + _yA), _objToCollide, true, true)
    }
    switch _col
    {
        case noone:
            ds_map_add(_list, "obj", -4)
            break
        default:
            var _obj = _col
            ds_map_add(_list, "obj", _obj)
            break
    }

    return _list;
}

