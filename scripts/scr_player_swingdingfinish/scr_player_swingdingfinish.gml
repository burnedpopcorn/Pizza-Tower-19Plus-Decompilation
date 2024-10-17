function scr_player_swingdingfinish() //scr_player_swingdingfinish
{
    collide_destructibles = function(argument0, argument1) //anon@65@scr_player_swingdingfinish_scr_player_swingdingfinish
    {
        if (sprite_index == spr_swingdingend)
            scr_destroy_horizontal(argument0)
    }

    hsp = xscale * movespeed
    momemtum = 1
    if (movespeed <= 0)
        movespeed += 0.2
    if (floor(image_index) == (image_number - 1))
    {
        state = (0 << 0)
        if input_check("dash")
            momemtum = 1
    }
    image_speed = (sprite_index != spr_Shotgun ? 0.45 : 0.5)
    landAnim = 0
}

