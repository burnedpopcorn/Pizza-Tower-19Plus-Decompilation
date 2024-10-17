pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0)
if (!smacked)
    draw_self()
else
    draw_sprite_stretched(sprite_index, image_index, (x - sprite_width / 2), (y - sprite_height / 2), sprite_width, (sprite_height + stretch))
if (!surface_exists(surf))
{
    surf = surface_create(room_width, room_height, 12)
    surface_set_target(surf)
    draw_clear_alpha(c_black, 0)
}
else
    surface_set_target(surf)
if smacked
{
    shader_set(shd_colorflash)
    draw_sprite_stretched_ext(sprite_index, image_index, (x - sprite_width / 2), (y - sprite_height / 2), sprite_width, (sprite_height + stretch), c_red, image_alpha)
}
surface_reset_target()
var tex = surface_get_texture(surf)
shader_set(shd_smudge)
shader_set_uniform_f(texel, texture_get_texel_width(tex), texture_get_texel_height(tex))
shader_set_uniform_f(radius, 8)
draw_surface_ext(surf, 0, 0, 1, 1, 0, c_white, 0.1)
shader_reset()
