if (state == (0 << 0))
{
    if surface_exists(dialoguebubblesurf)
        surface_free(dialoguebubblesurf)
    if surface_exists(nameboxsurf)
        surface_free(nameboxsurf)
    return;
}
var _bubblescale = tween(0, 1, bubblescaleanim, "out back")
var _nameboxscale = tween(0, 1, nameboxscaleanim, "out back")
var _char = self.get_char(scenario.lines[currentline].character)
if (!surface_exists(dialoguebubblesurf))
    dialoguebubblesurf = surface_create(750, 210)
surface_set_target(dialoguebubblesurf)
draw_clear_alpha(c_black, 0)
draw_sprite_ext(spr_npcdialoguebubble, 0, (surface_get_width(dialoguebubblesurf) / 2), (surface_get_height(dialoguebubblesurf) / 2), _bubblescale, _bubblescale, bubblerot, c_white, 1)
surface_reset_target()
if (!surface_exists(nameboxsurf))
    nameboxsurf = surface_create(264, 104)
surface_set_target(nameboxsurf)
draw_clear_alpha(c_black, 0)
draw_sprite_ext(spr_npcnamebox, 0, (surface_get_width(nameboxsurf) / 2), (surface_get_height(nameboxsurf) / 2), _nameboxscale, _nameboxscale, nameboxrot, _char[1], 1)
surface_reset_target()
var _yoff = (get_game_height() - 540) / 2
var _bubblex = 480
var _bubbley = _yoff + 427
var _nameboxx = 236
var _nameboxy = _yoff + 341
var _shadowcast = 3
draw_surface_ext(dialoguebubblesurf, (_bubblex + _shadowcast - surface_get_width(dialoguebubblesurf) / 2), (_bubbley + _shadowcast - surface_get_height(dialoguebubblesurf) / 2), 1, 1, 0, c_black, 1)
draw_surface_ext(nameboxsurf, (_nameboxx + _shadowcast - surface_get_width(nameboxsurf) / 2), (_nameboxy + _shadowcast - surface_get_height(nameboxsurf) / 2), 1, 1, 0, c_black, 1)
var _charx = lerp(70, 0, characterslide)
var _chara = lerp(0, 1, characterslide)
var _charspr = asset_get_index("spr_npcmugshot_" + scenario.lines[currentline].character + scenario.lines[currentline].expression)
if (!sprite_exists(_charspr))
    _charspr = spr_squidward
if (scenario.lines[currentline].character == "PP")
    pal_swap_set(spr_peppalette, obj_player.paletteselect, false)
draw_sprite_ext(_charspr, talkspr > 0, (630 + _charx), (_yoff + 261), 1, 1, 0, c_white, _chara)
shader_set(shd_premultiply)
draw_surface(dialoguebubblesurf, (_bubblex - surface_get_width(dialoguebubblesurf) / 2), (_bubbley - surface_get_height(dialoguebubblesurf) / 2))
shader_set(shd_blackoutline)
var _tex = surface_get_texture(dialoguebubblesurf)
shader_set_uniform_f(outlinetexel, texture_get_texel_width(_tex), texture_get_texel_height(_tex))
draw_surface(dialoguebubblesurf, (_bubblex - surface_get_width(dialoguebubblesurf) / 2), (_bubbley - surface_get_height(dialoguebubblesurf) / 2))
shader_set(shd_premultiply)
draw_surface(nameboxsurf, (_nameboxx - surface_get_width(nameboxsurf) / 2), (_nameboxy - surface_get_height(nameboxsurf) / 2))
shader_set(shd_blackoutline)
_tex = surface_get_texture(nameboxsurf)
shader_set_uniform_f(outlinetexel, texture_get_texel_width(_tex), texture_get_texel_height(_tex))
draw_surface(nameboxsurf, (_nameboxx - surface_get_width(nameboxsurf) / 2), (_nameboxy - surface_get_height(nameboxsurf) / 2))
shader_set(shd_premultiply)
draw_set_valign(fa_middle)
draw_set_halign(fa_left)
draw_set_font(global.npcnamefont)
draw_set_colour(c_white)
var _charnamex = tween((-string_width(_char[0])), (_nameboxx - 85), nameslideanim, "out back")
__draw_text_hook(_charnamex, _nameboxy, _char[0])
draw_set_font(font_dialogue)
var _str = string_wordwrap_width(scenario.lines[currentline].dialogue, 636, "\n", false)
if (ceil(currentchar) >= string_length(_str) && (2 << 0))
{
    nextbuttonind += 0.035
    nextbuttonind %= sprite_get_number(spr_npcnextbutton)
    draw_sprite_ext(spr_npcnextbg, 0, 822, (_yoff + 501), 1, 1, 0, _char[1], 1)
    draw_sprite_ext(spr_npcnextbutton, nextbuttonind, 822, (_yoff + 501), 1, 1, 0, c_white, 1)
}
else
    nextbuttonind = 0
draw_set_valign(fa_top)
draw_set_colour(c_black)
__draw_text_hook((_bubblex - 330), (_bubbley - 55), string_copy(_str, 1, floor(currentchar)))
draw_set_colour(c_white)
