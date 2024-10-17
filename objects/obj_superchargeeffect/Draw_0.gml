if ((!scr_hudroomcheck()) && global.battle == 0 && global.currentbadge != (2 << 0))
{
    with (obj_player)
        var check = (state != (54 << 0) && state != (41 << 0) && state != (39 << 0) && state != (114 << 0) && state != (128 << 0) && state != (76 << 0) && state != (14 << 0) && state != (21 << 0) && state != (34 << 0) && state != (110 << 0) && (!scr_transformationcheck(self)))
    with (obj_player)
    {
        if (check && supertauntcooldown >= 10)
        {
            with (other.id)
                draw_sprite(spr_supercharge, -1, other.x, other.y)
        }
    }
}
