draw_self()
if (sprite_index == spr_swordstone)
{
    grabindicatorind += 0.35
    grabindicatorind %= sprite_get_number(spr_grabicon)
    draw_sprite(spr_grabicon, grabindicatorind, x, (y - 20))
}
