draw_set_font(global.scorefont)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
var _x = 480
var _y = 135
var _scale = tween(0, 1, trans, "out back")
if (!flash)
    __draw_text_transformed_colour_hook((floor(_x) - 0.1), _y, text, _scale, _scale, 0, colour, colour, colour, colour, 1)
