function scr_player_balllol() //scr_player_balllol
{
    if (hsp >= (0 * xscale) && grounded)
        hsp -= (0.15 * xscale)
    if (hsp > 0)
        xscale = 1
    if (hsp < 0)
        xscale = -1
    mask_index = spr_crouchmask
    if ((((hsp * xscale) <= 0 && (!(instance_place((x + xscale), (y + 1), obj_slope)))) || (scr_solid((x + 1), y) && xscale == 1) || (scr_solid((x - 1), y) && xscale == -1)) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        hsp = 0
        state = (0 << 0)
        movespeed = 0
        mach2 = 0
        crouchslideAnim = 1
        image_index = 0
        crouchAnim = 1
        start_running = 1
        alarm[4] = 14
    }
    if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
    {
        with (instance_create_depth(x, y, 0, obj_slidecloud))
            image_xscale = other.xscale
    }
    image_speed = 1 / (max((4 - abs(hsp)), 1))
}

