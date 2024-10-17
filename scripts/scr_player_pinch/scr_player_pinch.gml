function scr_player_pinch() //scr_player_pinch
{
    hsp = move * movespeed
    move = input_check_opposing("left", "right")
    if (move != 0 && movespeed < 7)
        movespeed += 0.25
    if (movespeed > 7)
        movespeed -= 0.1
    if (y > pinchid.y)
        vsp -= 1.1
    if (y < pinchid.y && vsp < 0)
    {
        state = (36 << 0)
        sprite_index = spr_machfreefall
        bumped = 1
    }
    if input_check_pressed("jump")
    {
        state = (36 << 0)
        sprite_index = spr_machfreefall
        bumped = 1
    }
    image_speed = 0.35
}

