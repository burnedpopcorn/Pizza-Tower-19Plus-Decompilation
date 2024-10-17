function scr_player_barrelbounce() //scr_player_barrelbounce
{
    move = input_check_opposing("left", "right")
    if (!(place_meeting((x + xscale), y, obj_solid)))
        hsp = 2 * move
    blurafterimageeffect(3, 0.05)
    if (grounded && vsp >= 0)
    {
        state = (105 << 0)
        if (!input_check("dash"))
            landAnim = 1
        else
        {
            movespeed = 10 * xscale
            sprite_index = spr_barrelroll
        }
    }
    if ((!input_check("dash")) && vsp < -4 && (!(scr_solid(x, (y - 16)))))
    {
        state = (105 << 0)
        sprite_index = spr_barrelfall
    }
}

