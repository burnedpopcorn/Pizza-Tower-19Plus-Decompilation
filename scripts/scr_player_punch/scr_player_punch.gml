function scr_player_punch() //scr_player_punch
{
    move = input_check_opposing("left", "right")
    if grounded
    {
        if (dir != xscale)
        {
            dir = xscale
            movespeed = 2
            facehurt = 0
            armhurt = 0
            introscared = 0
        }
        jumpstop = 0
        anger = 100
        hsp = move * movespeed
        if (move != 0)
        {
            if (movespeed < 7)
                movespeed += 0.5
            else if (floor(movespeed) == 7)
                movespeed = 7
        }
        else
            movespeed = 0
        if (movespeed > 7)
            movespeed -= 0.1
        if (move != 0)
        {
            if (movespeed < 3 && move != 0)
                image_speed = 0.35
            else if (movespeed > 3 && movespeed < 6)
                image_speed = 0.45
            else
                image_speed = 0.6
        }
        else
            image_speed = 0.35
    }
    if (!grounded)
    {
        if (!momemtum)
            hsp = move * movespeed
        else
            hsp = xscale * movespeed
        if (move != xscale && momemtum && movespeed != 0)
            movespeed -= 0.05
        if (movespeed == 0)
            momemtum = 0
        if ((move == 0 && (!momemtum)) || scr_solid((x + hsp), y))
        {
            movespeed = 0
            mach2 = 0
        }
        if (move != 0 && movespeed < 7)
            movespeed += 0.25
        if (movespeed > 7)
            movespeed -= 0.05
        if ((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1))
            movespeed = 0
        if (dir != xscale)
        {
            mach2 = 0
            dir = xscale
            movespeed = 0
        }
        if (move == (-xscale))
        {
            mach2 = 0
            movespeed = 0
            momemtum = 0
        }
        landAnim = 1
        if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5 && (!stompAnim))
        {
            vsp /= 5
            jumpstop = 1
        }
        if (ladderbuffer > 0)
            ladderbuffer--
        if (scr_solid(x, (y - 1)) && (!jumpstop) && jumpAnim)
        {
            vsp = grav
            jumpstop = 1
        }
    }
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    if (floor(image_index) == (image_number - 1) || move == (-xscale))
        state = (0 << 0)
    sprite_index = spr_punch
    image_speed = 0.35
}

