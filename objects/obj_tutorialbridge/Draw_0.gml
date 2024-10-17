var _currope = 0
repeat image_xscale
{
    var _yoff = -2
    if (place_meeting(x, (y - 1), obj_player) && obj_player.grounded && obj_player.vsp >= 0)
    {
        if (_currope == clamp(floor((obj_player.x - x) / 32), 0, image_xscale))
            _yoff = 0
        if (_currope == clamp(((floor((obj_player.x - x) / 32)) - 1), 0, image_xscale))
            _yoff = -1
        if (_currope == clamp(((floor((obj_player.x - x) / 32)) + 1), 0, image_xscale))
            _yoff = -1
    }
    if (_currope > currentpiece)
        _yoff = -2
    draw_sprite(spr_tutorialbridgerope, 0, (x + _currope * sprite_get_width(sprite_index)), (y + _yoff))
    _currope++
}
var _curpiece = 0
repeat currentpiece
{
    _yoff = -2
    var _y = y
    if (place_meeting(x, (y - 1), obj_player) && obj_player.grounded && obj_player.vsp > 0)
    {
        if (_curpiece == clamp(floor((obj_player.x - x) / 32), 0, (currentpiece - 1)))
            _yoff = 0
        if (_curpiece == clamp(((floor((obj_player.x - x) / 32)) - 1), 0, (currentpiece - 1)))
            _yoff = -1
        if (_curpiece == clamp(((floor((obj_player.x - x) / 32)) + 1), 0, (currentpiece - 1)))
            _yoff = -1
    }
    if (_curpiece == (currentpiece - 1) && bridgepiecey != y)
    {
        _yoff = -2
        _y = bridgepiecey
    }
    draw_sprite(sprite_index, 0, (x + _curpiece * sprite_get_width(sprite_index)), (_y + _yoff))
    _curpiece++
}
