draw_self()
if (exclemationframe != -1)
{
    exclemationframe += 0.05
    exclemationframe %= sprite_get_number(spr_excelemation)
    draw_sprite(spr_excelemation, exclemationframe, x, (bbox_top - 30))
}
