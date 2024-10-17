if (!surface_exists(surf))
    surf = surface_create(get_game_width(), get_game_height())
if (surface_get_width(surf) != get_game_width() || surface_get_height(surf) != get_game_height())
    surface_resize(surf, get_game_width(), get_game_height())
surface_set_target(surf)
draw_clear_alpha(c_black, (fade * 0.5))
var _yoff = (get_game_height() - 540) / 2
var _camw = camera_get_view_width(view_camera[0])
var _backingy = 352 + _yoff
draw_sprite(spr_badgeshop_backing, 0, 0, _backingy)
for (var b = 0; b < badgeslots; b++)
{
    var _badge = badge_at_pos(badgeslots, badgerows, badges, b, (_camw / 2), _backingy)
    draw_sprite(spr_badgemenu_box, 0, _badge.x, _badge.y)
    save_open()
    if (!is_undefined(_badge.info))
    {
        draw_sprite_ext(spr_badgemenu_box, 0, _badge.x, _badge.y, 1, 1, 0, (ini_read_real("UnlockedBadges", _badge.info[2], false) ? c_gray : c_white), 1)
        draw_sprite_ext(_badge.info[0], 0, _badge.x, _badge.y, 1, 1, 0, (ini_read_real("UnlockedBadges", _badge.info[2], false) ? c_gray : c_white), 1)
        if (!(ini_read_real("UnlockedBadges", _badge.info[2], false)))
        {
            draw_sprite(spr_badgeshop_coin, 0, (_badge.x + 24), (_badge.y + 24))
            draw_set_valign(fa_top)
            draw_set_halign(fa_left)
            draw_set_font(global.smallfont)
            __draw_text_hook((_badge.x + 24 + 19), (_badge.y + 24), _badge.info[3])
        }
    }
    save_close()
}
var _selectedbadge = badge_at_pos(badgeslots, badgerows, badges, selectedbadge, (_camw / 2), _backingy)
draw_sprite(spr_badgemenu_selector, 0, (_selectedbadge.x + (wave(0, 8, 1, 0))), (_selectedbadge.y + (wave(0, 8, 1, 0))))
draw_sprite(spr_badgeshop_header, 0, 0, 0)
if (!is_undefined(_selectedbadge.info))
{
    draw_sprite(spr_badgemenu_explanationbox, bubbleind, 837, (174 + _yoff))
    draw_set_valign(fa_middle)
    draw_set_halign(fa_center)
    draw_set_font(global.thinfont)
    if (currentchar < string_length(_selectedbadge.info[1]))
    {
        if (string_copy(_selectedbadge.info[1], floor(currentchar), 1) == " ")
            currentchar += 2
        else
            currentchar++
        headspr = spr_badgemenu_mrincognitotalk
        if (headspr != spr_badgemenu_mrincognitotalk)
            headind = 0
    }
    __draw_text_hook(480, (80 + _yoff), string_copy(_selectedbadge.info[1], 1, floor(currentchar)))
}
draw_sprite(headspr, headind, 885, (150 + _yoff))
draw_set_font(global.thinfont)
draw_set_valign(fa_bottom)
draw_set_halign(fa_left)
draw_text_fancy(20, (get_game_height() - 20), string_get("menu/badge/exit"))
surface_reset_target()
draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, fade)
