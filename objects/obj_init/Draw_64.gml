var _perc = (texturecount - array_length(texturelist)) / texturecount
var _w = get_game_width()
var _h = get_game_height()
if stanley
{
    draw_sprite(spr_stanleyload, 0, (_w / 2), _h)
    draw_sprite_stretched(spr_1x1, 0, 696, (_h - 29), (150 * _perc), 15)
}
else
{
    draw_sprite_stretched(spr_1x1, 0, 0, (_h - 5), (_w * _perc), 5)
    draw_sprite_stretched(spr_1x1, 0, 0, 0, 5, (_h * _perc))
    draw_sprite_stretched(spr_1x1, 0, (_w * (1 - _perc)), 0, (_w * _perc), 5)
    draw_sprite_stretched(spr_1x1, 0, (_w - 5), (_h * (1 - _perc)), 5, (_h * _perc))
}
