function scr_playerC_normal() //scr_playerC_normal
{
    move = input_check_opposing("left", "right")
    hsp = xscale * movespeed
    if (sprite_index == spr_slimejump || sprite_index == spr_slimefall)
    {
        if (vsp > 0 && grounded)
        {
            if (move != 0)
                sprite_index = spr_slimemove
            else
                sprite_index = spr_slimeidle
            image_index = 0
        }
        if ((!input_check("jump")) && jumpstop == false && vsp < 0.5 && stompAnim == false)
        {
            vsp /= 10
            jumpstop = 1
        }
    }
    else
        jumpstop = false
    if (move != 0)
    {
        xscale = move
        movespeed = 1
        if grounded
            sprite_index = spr_slimemove
    }
    else
    {
        movespeed = 0
        if grounded
            sprite_index = spr_slimeidle
    }
    if (input_check_pressed("jump") && grounded && vsp >= 0)
    {
        vsp = -10
        sprite_index = spr_slimejump
        image_index = 0
    }
    if (sprite_index == spr_slimejump && floor(image_index) == (image_number - 1))
        sprite_index = spr_slimefall
    if input_check("attack")
    {
        state = (113 << 0)
        movespeed = 0
        sprite_index = spr_slime_rage
        image_index = 0
    }
    if ((!grounded) && sprite_index != spr_slimejump)
        sprite_index = spr_slimefall
    image_speed = 0.35
}

