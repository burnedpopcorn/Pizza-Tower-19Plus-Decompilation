for (var i = 0; i < abs(image_xscale); i++)
{
    var _spr = spr_railh
    if (i == 0)
        _spr = spr_railhleft
    if (i == (abs(image_xscale) - 1))
        _spr = spr_railhright
    draw_sprite_ext(_spr, -1, (x + 32 * i), y, 1, 1, image_angle, image_blend, image_alpha)
}
