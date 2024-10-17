if (sprite_index == spr_pizzaface_dead)
{
    var _texpos = sprite_get_uvs(sprite_index, image_index)
    var _samplex1 = _texpos[0] * 2048
    var _sampley1 = _texpos[1] * 2048
    var _samplex2 = _texpos[2] * 2048
    var _sampley2 = _texpos[3] * 2048
    var _samplew = _samplex2 - _samplex1
    var _sampleh = _sampley2 - _sampley1
    var _sampleox = sprite_get_xoffset(sprite_index) - _texpos[4]
    var _sampleoy = sprite_get_yoffset(sprite_index) - _texpos[5]
    draw_sprite_part(spr_pizzaface_sample, 0, _samplex1, _sampley1, _samplew, _sampleh, (x - _sampleox), (y - _sampleoy))
}
else
{
    pal_swap_set(palettespr, pal, 0)
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    shader_reset()
}
