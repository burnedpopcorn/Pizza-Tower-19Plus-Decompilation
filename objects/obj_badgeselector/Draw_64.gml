if (!surface_exists(surf))
    surf = surface_create(get_game_width(), get_game_height())
if (surface_get_width(surf) != get_game_width() || surface_get_height(surf) != get_game_height())
    surface_resize(surf, get_game_width(), get_game_height())
surface_set_target(surf)
draw_clear_alpha(c_black, (fade * 0.5))
var _yoff = (get_game_height() - 540) / 2
var _camw = camera_get_view_width(view_camera[0])
var _backingw = sprite_get_width(spr_badgemenu_backing)
var _backingcolumns = ceil(_camw / _backingw)
var _backingy = 352 + _yoff
for (var c = 0; c < _backingcolumns; c++)
    draw_sprite(spr_badgemenu_backing, 0, (_backingw * c), _backingy)
for (var b = 0; b < badgeslots; b++)
{
    var _badge = badge_at_pos(badgeslots, badgerows, badges, b, (_camw / 2), _backingy)
    draw_sprite(spr_badgemenu_box, 0, _badge.x, _badge.y)
    if (!is_undefined(_badge.info))
    {
        save_open()
        var _unlocked = (_badge.info[3] == -1 ? true : ini_read_real("UnlockedBadges", _badge.info[3], false))
        save_close()
        draw_sprite_ext(_badge.info[0], 0, _badge.x, _badge.y, 1, 1, 0, (_unlocked ? c_white : c_black), 1)
        if (!_unlocked)
            draw_sprite(spr_badgemenu_lock, 0, _badge.x, _badge.y)
    }
}
var _selectedbadge = badge_at_pos(badgeslots, badgerows, badges, selectedbadge, (_camw / 2), _backingy)
draw_sprite(spr_badgemenu_selector, 0, (_selectedbadge.x + (wave(0, 8, 1, 0))), (_selectedbadge.y + (wave(0, 8, 1, 0))))
draw_sprite(spr_badgemenu_header, 0, 0, 0)
if (!is_undefined(_selectedbadge.info))
{
    save_open()
    _unlocked = (_selectedbadge.info[3] == -1 ? true : ini_read_real("UnlockedBadges", _selectedbadge.info[3], false))
    save_close()
    var _str = (_unlocked ? _selectedbadge.info[2] : string_get("menu/badge/locked"))
    draw_sprite(spr_badgemenu_explanationbox, bubbleind, 837, (174 + _yoff))
    draw_set_valign(fa_middle)
    draw_set_halign(fa_center)
    if (currentchar < string_length(_str))
    {
        if (string_copy(_str, floor(currentchar), 1) == " ")
            currentchar += 2
        else
            currentchar++
        headspr = spr_badgemenu_mrincognitotalk
        if (headspr != spr_badgemenu_mrincognitotalk)
            headind = 0
    }
    __draw_text_hook(480, (80 + _yoff), string_copy(_str, 1, floor(currentchar)))
}
draw_sprite(headspr, headind, 885, (150 + _yoff))
surface_reset_target()
draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, fade)
