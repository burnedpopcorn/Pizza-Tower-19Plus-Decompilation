function scr_player_juggle() //scr_player_juggle
{
    if (sprite_index == spr_player_shoulderbashblow1 && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_player_juggle
        vsp = -13
        state = (36 << 0)
        image_index = 0
    }
}

