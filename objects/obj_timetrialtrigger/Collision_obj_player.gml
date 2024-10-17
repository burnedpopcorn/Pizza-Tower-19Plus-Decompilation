var _id = string_concat(room_get_name(room), "|", xstart, "|", ystart)
var _prevtime = ds_map_find_value(global.timetrialsplits, _id)
ds_map_set(global.timetrialsplits, _id, global.timetrialtick)
if (!is_undefined(_prevtime))
{
    var _timechange = global.timetrialtick - _prevtime
    var _milliseconds = string_padzeros(floor((((abs(_timechange) / 60) % 60) % 1) * 100))
    var _seconds = string_padzeros(floor((abs(_timechange) / 60) % 60))
    var _minutes = string_padzeros(((abs(_timechange) div 60) div 60) % 60)
    var _text = (sign(_timechange) == -1 ? "-" : "+")
    _text += string_concat(_minutes, ":", _seconds, ".", _milliseconds)
    var _col = (sign(_timechange) == -1 ? 16777215 : 255)
    with (instance_create_depth(-50, -50, 0, obj_timetrialtime))
    {
        text = _text
        colour = _col
    }
}
instance_destroy()
ds_list_add(global.saveroom, _id)
