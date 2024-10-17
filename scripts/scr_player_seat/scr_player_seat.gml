function scr_player_seat() //scr_player_seat
{
    hsp = 0
    vsp = 0
    movespeed = 0
    if input_check_pressed("jump")
    {
        if place_meeting(x, (y + 1), obj_seat)
        {
            with (instance_place(x, (y + 1), obj_seat))
                player_isseated = 0
        }
        state = (36 << 0)
        vsp = -8
        jumpAnim = 1
        sprite_index = spr_jump
        image_index = 0
    }
    image_speed = 0.35
}

