y--
image_alpha -= 0.02
draw_set_font(global.thinfont)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
__draw_text_colour_hook((x + (random_range(-2, 2))), y, "-5", 255, 255, 255, 255, image_alpha)
