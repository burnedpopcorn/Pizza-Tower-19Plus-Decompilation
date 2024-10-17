depth = 200
ind += 0.35
if (ind >= sprite_get_number(spr))
{
    if (spr == bg_pizzamartflicker)
        spr = bg_pizzamartloop
    ind = 0
}
draw_sprite(spr, ind, 0, 0)
draw_set_font(font)
draw_set_valign(fa_top)
draw_set_halign(fa_left)
__draw_text_hook(857, 394, "1")
