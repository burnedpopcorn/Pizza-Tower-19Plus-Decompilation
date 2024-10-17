draw_sprite_stretched_ext(spr_1x1, 0, 0, 0, get_game_width(), get_game_height(), c_black, (descalpha * 0.4))
draw_sprite_ext(spr_timetrials, 0, (get_game_width() / 2), 0, 1, 1, 0, c_white, descalpha)
draw_set_font(global.thinfont)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
__draw_text_transformed_colour_hook((get_game_width() / 2), (get_game_height() / 2 + 45), string_get("menu/timetrialpopup/desc"), descanim, descanim, descspin, 16777215, 16777215, 16777215, 16777215, (descstate == 2 ? descalpha : 1))
if (descanim == 1 && descstate == 1)
{
    draw_set_font(global.thinfont)
    draw_set_valign(fa_middle)
    draw_set_halign(fa_center)
    draw_text_fancy((get_game_width() / 2), (get_game_height() - 36), string_get("menu/timetrialpopup/exit"))
}
