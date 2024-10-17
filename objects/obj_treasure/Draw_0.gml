var _wave = 0
var _xoff = 0
if (!got)
    _wave = wave(7, -7, 1, 0)
else
{
    _xoff = -18
    gotind += 0.35
    gotind %= sprite_get_number(spr_treasurepickeffect)
    draw_sprite(spr_treasurepickeffect, gotind, x, (y + _wave))
}
draw_sprite(sprite_index, image_index, (x + _xoff), (y + _wave))
