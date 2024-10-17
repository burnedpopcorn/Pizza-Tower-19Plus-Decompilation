function scr_player_barrelnormal() //scr_player_barrelnormal
{
    mask_index = spr_player_mask
    move = input_check_opposing("left", "right")
    hsp = move * movespeed
    if (vsp < 12)
        vsp += grav
    if ((!grounded) && (!input_check_pressed("jump")))
    {
        state = (60 << 0)
        image_index = 0
        hsp = 0
    }
    if ((input_check("down") && grounded) || scr_solid(x, (y - 3)))
    {
        state = (56 << 0)
        image_index = 0
    }
    if (input_check("dash") && grounded)
    {
        movespeed = 0
        state = (59 << 0)
        landAnim = 0
    }
    if place_meeting(x, y, obj_water2)
        vsp -= 1
    movespeed = 2.5
    if (move == 0)
        sprite_index = spr_player_barrelidle
    if (move != 0)
    {
        sprite_index = spr_player_barrelmove
        xscale = move
    }
    image_speed = 0.35
}

