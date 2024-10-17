var _count = 0
for (var _i = 0; _i < array_length(obj); _i++)
    _count += instance_number(obj[_i])
var _instances = array_create(_count, -4)
var _index = 0
for (var i = 0; i < array_length(obj); i++)
{
    with (obj[i])
    {
        if ((!(object_is_ancestor(object_index, obj_baddie))) || state != 107)
            _instances[_index++] = id
    }
}
i = 0
while (i < array_length(_instances))
{
    var _inst = _instances[i]
    if (_inst == noone)
        break
    else
    {
        if (!(bbox_in_camera(1, _inst, 100)))
        {
        }
        else
        {
            var _ray = room_height
            var _prevy = _inst.y
            var _on25d = true
            with (_inst)
            {
                _ray = fast_ray(bbox_left, bbox_top, bbox_right, room_height)
                y += (_ray - bbox_bottom)
                if scr_solid(x, (y + 1))
                    _on25d = object_get_parent(instance_place(x, (y + 1), obj_parsolid).object_index) == obj_parsolid
            }
            if _on25d
            {
                var _angle = 0
                var _yoff = 0
                with (_inst)
                {
                    if scr_slope()
                    {
                        var _slope = instance_place(x, (y + 1), obj_slope)
                        var _onslope = false
                        if (sign(x + -4 - _slope.bbox_left) == 1 && sign(x + 4 - _slope.bbox_right) == -1)
                            _onslope = true
                        if _onslope
                        {
                            if (abs(_slope.image_xscale) > abs(_slope.image_yscale))
                            {
                                _angle = 30 * sign(_slope.image_xscale)
                                _yoff = 6
                            }
                            else
                            {
                                _angle = 45 * sign(_slope.image_xscale)
                                _yoff = 12
                            }
                        }
                    }
                }
                _inst.y = _prevy
                var _size = (125 - (point_distance(0, _inst.y, 0, (_inst.y + _ray - _inst.bbox_bottom)))) / 125
                if (_size < 0)
                    _size = 0
                draw_sprite_ext(spr_25dshadow, 0, _inst.x, (_inst.y + _ray - _inst.bbox_bottom + 44 + _yoff), _size, _size, _angle, c_white, 1)
            }
            _inst.y = _prevy
        }
        i++
    }
}
