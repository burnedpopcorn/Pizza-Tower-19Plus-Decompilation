var _texpos = sprite_get_uvs(sprite_index, image_index)
var _samplex1 = _texpos[0] * 2048
var _sampley1 = _texpos[1] * 2048
var _samplex2 = _texpos[2] * 2048
var _sampley2 = _texpos[3] * 2048
var _samplew = _samplex2 - _samplex1
var _sampleh = _sampley2 - _sampley1
var _sampleox = sprite_get_xoffset(sprite_index) - _texpos[4]
var _sampleoy = sprite_get_yoffset(sprite_index) - _texpos[5]
draw_sprite_part(spr_pizzaface_sample, 0, _samplex1, _sampley1, _samplew, _sampleh, (x + stunshakeX - _sampleox), (y + stunshakeY - _sampleoy))
