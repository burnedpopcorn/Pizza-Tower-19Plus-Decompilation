if (!instance_exists(obj_player))
    return;
draw_set_font(global.smallnumber)
draw_set_valign(fa_top)
draw_set_halign(fa_center)
var _y = roundlower(obj_player.y) - 132
var _squishhhhh = wave((-squish), squish, 1, 0)
draw_sprite_ext(spr_pizzacoincounterbar, 0, (roundlower(obj_player.x) - 1), (_y + 48), (1 + _squishhhhh), (1 - _squishhhhh), 0, c_white, image_alpha)
draw_sprite_ext(spr_pizzacoin, -1, (roundlower(obj_player.x) - 32 + 16 * (1 - _squishhhhh)), (_y - 38 + 48 * _squishhhhh), (1 + _squishhhhh), (1 - _squishhhhh), 0, c_white, image_alpha)
var _count = "0/0"
if (global.levelname != -4 && global.levelname != "tutorial")
    _count = string_padzeros(get_levelcoincount(global.levelname)) + "/25"
else
{
    var _maxcoins = 25 * array_length(global.levels)
    var _coins = 0
    for (var i = 0; i < array_length(global.levels); i++)
        _coins += get_levelcoincount(global.levels[i])
    save_open()
    _coins -= ini_read_real("GameProgress", "usedcoins", 0)
    save_close()
    with (obj_pizzacoinsubtract)
        _coins += (-number)
    var _coinstr = string_padzeros(_coins)
    _count = string_concat(_coinstr, "/", _maxcoins)
}
__draw_text_transformed_colour_hook((roundlower(obj_player.x) - 0.1), (_y + 32 * _squishhhhh), _count, (1 + _squishhhhh), (1 - _squishhhhh), 0, 16777215, 16777215, 16777215, 16777215, image_alpha)
draw_set_font(global.smallfont)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
if obj_player.combopointduration
{
    if (obj_player.textalpha < 1)
        obj_player.textalpha += 0.05
}
else if (obj_player.textalpha > 0)
    obj_player.textalpha -= 0.05
__draw_text_colour_hook(roundlower(obj_player.x), (roundlower(obj_player.y) - 50), string(obj_player.combopointstogive), 16777215, 16777215, 16777215, 16777215, obj_player.textalpha)
