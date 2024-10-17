function scr_player_smallpepdash() //scr_player_smallpepdash
{
    move = input_check_opposing("left", "right")
    hsp = xscale * movespeed
    landAnim = false
    stompAnim = false
    if (sprite_index == spr_smalldashstart)
    {
        if (floor(image_index) == (image_number - 1))
            sprite_index = spr_smalldash
        movespeed = 2
    }
    if (sprite_index == spr_smalldash)
        movespeed = 7
    if ((!input_check("dash")) || place_meeting((x + xscale), y, obj_solid) || (!grounded))
    {
        state = (106 << 0)
        sprite_index = spr_smallidle
        movespeed = 0
    }
    if grounded
        stompAnim = false
    image_speed = 0.35
}

