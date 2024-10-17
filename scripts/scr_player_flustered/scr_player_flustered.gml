function scr_player_flustered() //scr_player_flustered
{
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 3.3
    }
    if place_meeting((x + hsp), y, obj_solid)
        xscale *= -1
    mach2 = 0
    move = input_check_opposing("left", "right")
    hsp = xscale * movespeed
    image_speed = 0.35
    sprite_index = spr_player_flustered
    movespeed = 3.3
    hurted = 1
    if (sprite_index == spr_player_flustered && floor(image_index) == (image_number - 1))
    {
        state = (0 << 0)
        hsp = 0
        movespeed = 0
        hurted = 0
    }
    if (move != 0 && floor(image_index) == 2 && steppy == 0)
    {
        instance_create_depth(x, (y + 43), 0, obj_cloudeffect)
        steppy = 1
    }
    if (move != 0 && floor(image_index) != 2)
        steppy = 0
}

