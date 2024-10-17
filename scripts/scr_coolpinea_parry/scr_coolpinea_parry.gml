function scr_coolpinea_parry() //scr_coolpinea_parry
{
    hsp = 0
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = walkspr
        state = 100
    }
    image_speed = 0.35
}

