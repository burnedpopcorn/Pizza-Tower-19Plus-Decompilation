if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_sagegatetrans)
{
    sprite_index = spr_player_sagegate
    image_index = 0
}
spdmul = Approach(spdmul, 1, 0.025)
scale = Approach(scale, 0, (0.0075 * spdmul))
dist = lerp(0, startdist, scale)
dir += (9 * spdmul)
dir %= 360
pal_swap_set(obj_player.spr_palette, obj_player.paletteselect, 0)
draw_sprite_ext(sprite_index, image_index, (x + (lengthdir_x(dist, dir))), (y + (lengthdir_y(dist, dir))), scale, scale, 0, c_white, 1)
shader_reset()
