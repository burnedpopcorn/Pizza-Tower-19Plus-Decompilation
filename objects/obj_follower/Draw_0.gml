var _x = roundlower(x)
var _y = roundlower(y)
var _xscale = xscale * obj_player.scale_xs
var _yscale = image_yscale * obj_player.scale_ys
draw_sprite_ext(sprite_index, image_index, _x, _y, _xscale, _yscale, image_angle, image_blend, image_alpha)
if obj_drawcontroller.dark
    draw_sprite_ext(sprite_index, image_index, _x, _y, _xscale, _yscale, image_angle, c_black, (obj_player.darkalpha * image_alpha))
