save_open()
var _achperc = ach_perc()
save_close()
var _targetobj = obj_player
var _xscale = obj_player.xscale
if ((!persistent) && instance_exists(obj_hattoggle))
{
    _targetobj = obj_hattoggle
    _xscale = 1
}
var _targetx = _targetobj.x
var _targety = _targetobj.bbox_top + (wave(-5, 5, 2, 0))
var _scalex = 1
var _scaley = 1
if persistent
{
    _scalex = obj_player.scale_xs
    _scaley = obj_player.scale_ys
    if (obj_player.mask_index == spr_masknull)
        _targety += 40
    if instance_exists(obj_sagegateplayer)
    {
        var _playerx = obj_sagegateplayer.x + (lengthdir_x(obj_sagegateplayer.dist, obj_sagegateplayer.dir))
        var _playery = obj_sagegateplayer.y + (lengthdir_y(obj_sagegateplayer.dist, obj_sagegateplayer.dir))
        _scalex = obj_sagegateplayer.scale
        _scaley = obj_sagegateplayer.scale
        _targetx = _playerx
        _targety = _playery + sprite_get_bbox_top(obj_sagegateplayer.sprite_index) - 15
    }
}
else
    _targety += 20
if global.hatbounce
{
    hsp = lerp(hsp, ((_targetx - x) * 0.5), 0.2)
    vsp = lerp(vsp, ((_targety - y) * 0.5), 0.2)
    x += hsp
    y += vsp
}
else
{
    x = _targetx
    y = _targety
}
depth = _targetobj.depth - 1 + (persistent ? 99 : 0)
if (!surface_exists(surf))
    surf = surface_create(100, (100 * (1 + _achperc * 2)))
else if (surface_get_height(surf) != (100 * _achperc * 5))
    surface_resize(surf, 100, (100 * (1 + _achperc * 2)))
surface_set_target(surf)
draw_clear_alpha(c_black, 0)
draw_sprite_ext(spr_cowboyhatstretch, _achperc >= 1, (surface_get_width(surf) / 2), surface_get_height(surf), _xscale, (1 + _achperc * 2), 0, c_white, 1)
draw_sprite_ext(spr_cowboyhat, _achperc >= 1, (surface_get_width(surf) / 2), surface_get_height(surf), _xscale, 1, 0, c_white, 1)
surface_reset_target()
if (instance_exists(obj_sagegateplayer) || obj_player.visible)
    draw_surface_ext(surf, (x - surface_get_width(surf) / 2 * _scalex), (y - surface_get_height(surf) * _scaley), _scalex, _scaley, 0, c_white, 1)
