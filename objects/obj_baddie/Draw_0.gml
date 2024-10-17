stompscale = lerp(stompscale, 0, 0.25)
var truespriteh = sprite_get_yoffset(sprite_index)
var stompyshift = stompscale * truespriteh - truespriteh + truespriteh
var _x = roundlower(x)
var _y = roundlower(y) + stompyshift
var _xscale = image_xscale + stompscale * image_xscale
var _yscale = image_yscale - stompscale
if flash
    shader_set(shd_hit)
else if ((object_index == obj_cheeseslime && snotty) || (object_index == obj_forknight && yellow))
    pal_swap_set(enemypalette, 2, 0)
else if (enemypalette != -1)
    pal_swap_set(enemypalette, global.enemypalette, 0)
var _shakex = 0
var _shakey = 0
if (state == 300)
{
    _shakex = obj_player.hitstunshakeX
    _shakey = obj_player.hitstunshakeY
}
if (obj_player.sprite_index == obj_player.spr_supertaunt1 || obj_player.sprite_index == obj_player.spr_supertaunt2 || obj_player.sprite_index == obj_player.spr_supertaunt3 || obj_player.sprite_index == obj_player.spr_supertaunt4 || obj_player.sprite_index == spr_player_supertauntass)
{
    _shakex = irandom_range(-4, 4)
    _shakey = irandom_range(-4, 4)
}
draw_sprite_ext(sprite_index, image_index, (_x + _shakex), (_y + _shakey), _xscale, _yscale, image_angle, image_blend, image_alpha)
if obj_drawcontroller.dark
    draw_sprite_ext(sprite_index, image_index, (_x + _shakex), (_y + _shakey), _xscale, _yscale, image_angle, c_black, darkalpha)
shader_reset()
