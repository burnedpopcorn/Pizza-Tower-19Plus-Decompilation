if place_meeting(x, y, obj_player)
{
    draw_set_font(global.scorefont)
    draw_set_colour(c_white)
    draw_set_valign(fa_bottom)
    draw_set_halign(fa_center)
    var _str = ""
    if (perc != -1)
        _str += string_concat(perc, "%")
    if (time != -1)
    {
        var _filemilliseconds = string_padzeros(floor((((time / 60) % 60) % 1) * 100))
        var _fileseconds = string_padzeros(floor((time / 60) % 60))
        var _fileminutes = string_padzeros(((time div 60) div 60) % 60)
        var _filehours = string_padzeros(((time div 60) div 60) div 60)
        _str += string("\n{0}:{1}:{2}.{3}", _filehours, _fileminutes, _fileseconds, _filemilliseconds)
    }
    __draw_text_hook((x + sprite_width / 2 - 40), (y - 30), _str)
}
