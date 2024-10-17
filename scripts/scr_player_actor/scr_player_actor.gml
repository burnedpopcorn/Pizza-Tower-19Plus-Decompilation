function scr_player_actor() //scr_player_actor
{
    if (sprite_index == spr_gnomecutscene2)
    {
        if (image_index > (image_number - 1))
            image_index = image_number - 1
    }
    if (sprite_index == spr_gnomecutscene3)
    {
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_gnomecutscene4
            image_index = 0
        }
    }
    if (sprite_index == spr_player_hardbossintrostart)
    {
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_player_hardbossintroloop
            image_index = 0
        }
    }
    if (sprite_index == spr_gnomecutscene5 || sprite_index == spr_player_hardbossintroend)
    {
        if (floor(image_index) == (image_number - 1))
        {
            state = (0 << 0)
            gnomecutscene = 0
        }
    }
}

