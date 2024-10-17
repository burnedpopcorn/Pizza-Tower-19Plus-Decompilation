function scr_player_barrelmach1() //scr_player_barrelmach1
{
    hsp = xscale * movespeed
    if (movespeed <= 9)
        movespeed += 0.3
    if (vsp < 12)
        vsp += grav
    if grounded
    {
        if (mach2 < 35)
            mach2++
        if (mach2 >= 35)
        {
            image_index = 0
            state = (62 << 0)
            flash = 1
        }
    }
    if (!grounded)
    {
        state = (60 << 0)
        image_index = 0
        hsp = 0
    }
    if ((!input_check("dash")) && grounded)
    {
        state = (61 << 0)
        image_index = 0
        mach2 = 0
    }
    if (scr_solid((x + 1), y) && xscale == 1 && (!scr_slope()) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        state = (60 << 0)
        hsp = -2
        vsp = -2
        mach2 = 0
        image_index = 0
        instance_create_depth((x + 10), (y + 10), 0, obj_bumpeffect)
    }
    if (scr_solid((x - 1), y) && xscale == -1 && (!scr_slope()) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        state = (60 << 0)
        hsp = 2
        vsp = -2
        mach2 = 0
        image_index = 0
        instance_create_depth((x - 10), (y + 10), 0, obj_bumpeffect)
    }
    sprite_index = spr_player_barrelmach
    image_speed = 0.35
    if ((!instance_exists(obj_dashcloud)) && grounded)
        instance_create_depth(x, y, 0, obj_dashcloud)
}

