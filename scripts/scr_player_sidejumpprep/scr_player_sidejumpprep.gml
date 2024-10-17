function scr_player_sidejumpprep() //scr_player_sidejumpprep
{
    hsp = 0
    vsp = 0
    hsp = xscale * movespeed
    if (sprite_index == spr_player_supersidejumpprep && floor(image_index) == (image_number - 1))
    {
        state = (85 << 0)
        sprite_index = spr_player_supersidejump
        image_index = 0
        movespeed = 12
        scr_fmod_soundeffect(char_superjumpsnd, x, y)
    }
    image_speed = 0.4
}

