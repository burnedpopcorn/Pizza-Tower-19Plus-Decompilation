function __ptp_draw_text(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) //__ptp_draw_text
{
    if (argument3 == undefined)
        argument3 = 0x000001
    if (argument4 == undefined)
        argument4 = 1
    if (argument5 == undefined)
        argument5 = 0
    if (argument6 == undefined)
        argument6 = draw_get_color()
    if (argument7 == undefined)
        argument7 = draw_get_color()
    if (argument8 == undefined)
        argument8 = draw_get_color()
    if (argument9 == undefined)
        argument9 = draw_get_color()
    if (argument10 == undefined)
        argument10 = draw_get_alpha()
    var _prevshader = shader_current()
    var _sdf = font_get_sdf_enabled(draw_get_font())
    if (_sdf && _prevshader == shd_premultiply)
        shader_set(shd_sdf_premultiply)
    draw_text_transformed_colour((argument0 - 0.01), argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10)
    if (_sdf && _prevshader == shd_premultiply)
        shader_set(_prevshader)
}

function __ptp_draw_text_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12) //__ptp_draw_text_ext
{
    if (argument5 == undefined)
        argument5 = 1
    if (argument6 == undefined)
        argument6 = 1
    if (argument7 == undefined)
        argument7 = 0
    if (argument8 == undefined)
        argument8 = draw_get_color()
    if (argument9 == undefined)
        argument9 = draw_get_color()
    if (argument10 == undefined)
        argument10 = draw_get_color()
    if (argument11 == undefined)
        argument11 = draw_get_color()
    if (argument12 == undefined)
        argument12 = draw_get_alpha()
    var _prevshader = shader_current()
    var _sdf = font_get_sdf_enabled(draw_get_font())
    if (_sdf && _prevshader == shd_premultiply)
        shader_set(shd_sdf_premultiply)
    draw_text_ext_transformed_colour((argument0 - 0.01), argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12)
    if (_sdf && _prevshader == shd_premultiply)
        shader_set(_prevshader)
}

function __draw_text_hook(argument0, argument1, argument2) //__draw_text_hook
{
    __ptp_draw_text(argument0, argument1, argument2)
}

function __draw_text_ext_hook(argument0, argument1, argument2, argument3, argument4) //__draw_text_ext_hook
{
    __ptp_draw_text_ext(argument0, argument1, argument2, argument3, argument4)
}

function __draw_text_colour_hook(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //__draw_text_colour_hook
{
    __ptp_draw_text(argument0, argument1, argument2, 1, 1, 0, argument3, argument4, argument5, argument6, argument7)
}

function __draw_text_transformed_hook(argument0, argument1, argument2, argument3, argument4, argument5) //__draw_text_transformed_hook
{
    __ptp_draw_text(argument0, argument1, argument2, argument3, argument4, argument5)
}

function __draw_text_ext_colour_hook(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) //__draw_text_ext_colour_hook
{
    __ptp_draw_text_ext(argument0, argument1, argument2, argument3, argument4, 1, 1, 0, argument5, argument6, argument7, argument8, argument9)
}

function __draw_text_ext_transformed_hook(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //__draw_text_ext_transformed_hook
{
    __ptp_draw_text_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7)
}

function __draw_text_transformed_colour_hook(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) //__draw_text_transformed_colour_hook
{
    __ptp_draw_text(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10)
}

function __draw_text_ext_transformed_colour_hook(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12) //__draw_text_ext_transformed_colour_hook
{
    __ptp_draw_text_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12)
}

function draw_text_fancy(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //draw_text_fancy
{
    if (argument3 == undefined)
        argument3 = c_white
    if (argument4 == undefined)
        argument4 = 1
    if (argument5 == undefined)
        argument5 = true
    if (argument6 == undefined)
        argument6 = input_profile_get()
    if (argument7 == undefined)
        argument7 = 0
    var _font = draw_get_font()
    var _halign = draw_get_halign()
    var _valign = draw_get_valign()
    draw_set_valign(fa_top)
    draw_set_halign(fa_left)
    var _width = -5
    var _lines = string_split(argument2, "\n")
    for (var l = 0; l < array_length(_lines); l++)
    {
        if (string_width(_lines[l]) > _width)
            _width = string_width_fancy(_lines[l])
    }
    var _startingx = argument0
    if (_halign == fa_center)
        argument0 -= (_width / 2)
    else if (_halign == fa_right)
        argument0 -= _width
    var _lineheight = string_height("A") + global.fontextra[_font][7]
    var _height = ((string_count("\n", argument2)) + 1) * _lineheight
    if (_valign == fa_middle)
        argument1 -= (_height / 2)
    else if (_valign == fa_bottom)
        argument1 -= _height
    var _frame = floor(current_time / 16.666666666666668)
    var _shake = false
    var _vertshake = false
    var _wave = false
    var _vertshakedir = (floor(_frame / 2)) % 2
    var _drawinputs = []
    var _prevshader = shader_current()
    var _sdf = font_get_sdf_enabled(draw_get_font())
    if (_sdf && _prevshader == shd_premultiply)
        shader_set(shd_sdf_premultiply)
    for (var i = 1; i < (string_length(argument2) + 1); i++)
    {
        var _char = string_char_at(argument2, i)
        var _input = string_copy(argument2, i, 3)
        var _xoff = 0
        var _yoff = 0
        if (_char == "\n")
        {
            argument1 += _lineheight
            var _nextlineendpos = string_pos_ext("\n", argument2, (i + 1))
            if (_nextlineendpos == 0)
                _nextlineendpos = string_length(argument2)
            _nextlineendpos -= i
            var _nextlinestr = string_copy(argument2, (i + 1), _nextlineendpos)
            argument0 = _startingx
            if (_halign == fa_center)
                argument0 -= (string_width_fancy(_nextlinestr) / 2)
            if (_halign == fa_right)
                argument0 -= string_width_fancy(_nextlinestr)
        }
        else
        {
            switch _input
            {
                case "{S}":
                    _shake = true
                    i += 2
                    break
                case "{V}":
                    _vertshake = true
                    i += 2
                    break
                case "{W}":
                    _wave = true
                    i += 2
                    break
                case "{/}":
                    _shake = false
                    _wave = false
                    i += 2
                    break
                default:
                    if _shake
                    {
                        _xoff = irandom_range(-1, 1)
                        _yoff = irandom_range(-1, 1)
                    }
                    _vertshakedir = (!_vertshakedir)
                    if _vertshake
                        _yoff = _vertshakedir
                    if _wave
                        _yoff = wave(-2, 2, 1, 0, (current_time + argument0))
                    if (!(is_undefined(ds_map_find_value(global.inputs, _input))))
                    {
                        var _verb = ds_map_find_value(global.inputs, _input)
                        array_push(_drawinputs, [round(argument0 + global.fontextra[_font][5] + _xoff), round(argument1 + global.fontextra[_font][6] + _yoff), _verb])
                        argument0 += global.fontextra[_font][4]
                        i += 2
                        break
                    }
                    else
                    {
                        draw_text_colour(round(argument0 + _xoff), round(argument1 + _yoff), _char, argument3, argument3, argument3, argument3, argument4)
                        argument0 += string_width(_char)
                    }
            }

        }
    }
    if (_sdf && _prevshader == shd_premultiply)
        shader_set(_prevshader)
    for (var _i = 0; _i < array_length(_drawinputs); _i++)
        draw_input(_drawinputs[_i][0], _drawinputs[_i][1], argument4, _drawinputs[_i][2], argument5, argument6, argument7, global.fontextra[_font][0], global.fontextra[_font][1], global.fontextra[_font][2], global.fontextra[_font][3])
    draw_set_halign(_halign)
    draw_set_valign(_valign)
}

