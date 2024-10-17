draw_self()
if (!(place_meeting(x, (y + 1), obj_solid)))
    draw_sprite_ext(spr_grindslopeloop, -1, x, (y + 32), image_xscale, image_yscale, 0, image_blend, image_alpha)
