var _spr = asset_get_index("spr_cowboytask_" + saveid)
if sprite_exists(_spr)
    sprite = _spr
save_open()
var _ind = ini_read_real("Achievements", saveid, false)
save_close()
draw_sprite(sprite, _ind, x, y)
if place_meeting(x, y, obj_player)
{
    textalpha += 0.05
    if (textalpha > 1)
        textalpha = 1
}
else
{
    textalpha -= 0.05
    if (textalpha < 0)
        textalpha = 0
}
