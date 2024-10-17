if (textalpha > 0)
{
    draw_set_font(global.thinfont)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    var _str = "???\n???"
    if self.hidecond()
        _str = string_concat(string_get("tasks/" + saveid), "\n", string_get("tasks/" + saveid + "desc"))
    __draw_text_colour_hook((480 + (random_range(1, -1))), (get_game_height() - 84), _str, 16777215, 16777215, 16777215, 16777215, textalpha)
}
