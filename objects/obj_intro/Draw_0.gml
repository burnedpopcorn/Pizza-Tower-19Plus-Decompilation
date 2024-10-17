draw_sprite(background, -1, 0, 0)
var _panbodge = max(0, pan)
var _towery = tween(-600, 0, _panbodge, "out cubic")
var _pepy = tween(0, 760, _panbodge, "out cubic")
if (scene == 1)
{
    _towery = 0
    _pepy = 0
}
if (scene == 2)
{
    for (var i = 0; i < 4; i += 1)
        draw_sprite(spr_intro_clouds, -1, round(cloudsX + i * 960), _towery)
}
draw_sprite(tower, -1, 0, _towery)
draw_sprite(sprite_index, -1, 0, _pepy)
