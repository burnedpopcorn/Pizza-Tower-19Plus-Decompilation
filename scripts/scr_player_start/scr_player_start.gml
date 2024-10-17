function scr_player_start() //scr_player_start
{
    if (keyboard_check_pressed(vk_return) || input_check("jump"))
    {
        state = (0 << 0)
        with (obj_drawcontroller)
            thintextfade = 1
    }
    if (sprite_index == spr_player_startintro && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_player_startidle
        image_index = 0
    }
    hsp = 0
}

