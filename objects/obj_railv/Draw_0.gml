for (var i = 0; i < abs(image_xscale); i++)
{
    var _spr = spr_railv
    if (i == 0)
        _spr = spr_railvup
    if (i == (abs(image_xscale) - 1))
        _spr = spr_railvdown
    draw_sprite_ext(_spr, -1, x, (y + 32 * i), 1, 1, image_angle, image_blend, image_alpha)
}
