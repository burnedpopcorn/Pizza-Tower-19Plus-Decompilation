var _temp_local_var_1;
for (var l = 0; l < array_length(vfxobjs); l++)
{
    var o = vfxobjs[l]
    var inst = vfx[l]
    var _temp_local_var_1 = o
    if (o == obj_blueeffect && shader_current() != shd_colorflash)
        shader_set(shd_colorflash)
    else if (shader_current() != shd_pal_swapper)
        pal_swap_set(spr_palette, paletteselect, 0)
    for (var h = 0; h < array_length(inst); h++)
    {
        with (inst[h])
            draw_self()
    }
    vfx[l] = []
}
if flash
    shader_set(shd_hit)
var _x = roundlower(x + hitstunshakeX)
var _y = roundlower(y + hitstunshakeY)
var _xscale = xscale * scale_xs * gravityflip * exitgatescale
var _yscale = yscale * scale_ys * gravityflip * exitgatescale
var _angle = angle
if (state == (109 << 0))
    _angle = fireworkangle - 90
draw_sprite_ext(sprite_index, image_index, _x, _y, _xscale, _yscale, _angle, image_blend, image_alpha)
shader_reset()
if (obj_drawcontroller.dark && sprite_index != spr_fireass && sprite_index != spr_fireassground)
    draw_sprite_ext(sprite_index, image_index, _x, _y, _xscale, _yscale, _angle, c_black, (darkalpha * image_alpha))
if (sprite_index == spr_swingding)
{
    spineffectind += 0.35
    draw_sprite(spr_spineffect, spineffectind, x, y)
}
if (sprite_index == spr_swingding && grounded)
    draw_sprite_ext(spr_swingdingeffect, image_index, _x, _y, _xscale, _yscale, image_angle, image_blend, image_alpha)
shieldind += 0.35
if shieldblocking
{
    if (shieldind >= sprite_get_number(spr_pizzashield_block))
        shieldblocking = false
}
else
    shieldind %= sprite_get_number(spr_pizzashield)
for (var i = 0; i < shield; i++)
{
    var _spr = spr_pizzashield
    var _ind = (shieldind + i * 5) % sprite_get_number(spr_pizzashield)
    var _sx = i * 20
    if (shieldblocking && i == (shield - 1))
    {
        _spr = spr_pizzashield_block
        _ind = shieldind
    }
    draw_sprite_ext(_spr, _ind, (_x + _sx * xscale), _y, xscale, yscale, 0, c_white, 1)
    if obj_drawcontroller.dark
        draw_sprite_ext(_spr, _ind, (_x + _sx * xscale), _y, xscale, yscale, 0, c_black, darkalpha)
}
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_font(global.smallfont)
if (state == (121 << 0))
{
    __draw_text_hook((x - 64), (y - 32), string(kingbubbleangle))
    __draw_text_hook((x - 64), (y - 64), string(movespeed))
}
draw_set_font(global.font)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
if (state == (101 << 0))
    draw_sprite(spr_grabbiehand_catch, -1, x, (y - 20))
