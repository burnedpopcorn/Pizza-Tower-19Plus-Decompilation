function scr_player_grind() //scr_player_grind
{
    sprite_index = spr_grind
    image_speed = 0.35
    machhitAnim = 0
    crouchslideAnim = 1
    hsp = xscale * movespeed
    if (movespeed < 10)
        movespeed = 10
    if ((!(place_meeting(x, (y + 18), obj_grindrail))) && (!(place_meeting(x, (y + 18), obj_grindrailslope))))
    {
        if (movespeed < 12)
            state = (47 << 0)
        else
            state = (66 << 0)
    }
    if (place_meeting((x + xscale), y, obj_solid) && (!(place_meeting(x, (y + 18), obj_grindrailslope))) && (!(place_meeting(x, (y + 1), obj_slope))))
    {
        state = (49 << 0)
        hsp = (-xscale) * 5
        vsp = 1
    }
    if (movespeed < 24 && move == xscale)
        movespeed += 0.1
    if input_check_pressed("jump")
    {
        vsp = -11
        jumpstop = 0
        image_index = 0
        if (movespeed < 12)
            state = (47 << 0)
        else
            state = (66 << 0)
    }
    if (!instance_exists(obj_grindeffect))
        instance_create_depth(x, y, 0, obj_grindeffect)
}

