var _gateheight = sprite_get_bbox_bottom(gatespr) - sprite_get_bbox_top(gatespr)
var _y = y - sprite_yoffset + sprite_get_bbox_top(gatespr) + _gateheight / 2
save_open()
var _secrets = ini_read_real("Secrets", level, 0)
save_close()
var _curreye = 0
repeat (3)
{
    _curreye++
    var _sprite = spr_gatesecreteyeopen
    if (_curreye > _secrets)
        _sprite = spr_gatesecreteyeclosed
    with (instance_create_depth(x, _y, depth, obj_gateeye))
    {
        timer = current_time + 600000 * _curreye * 2
        durx += (_curreye - 1)
        dury += ((_curreye - 1) * 2)
        sprite_index = _sprite
        yrange = _gateheight / 2 - 15
        startingdepth = other.depth
    }
}
