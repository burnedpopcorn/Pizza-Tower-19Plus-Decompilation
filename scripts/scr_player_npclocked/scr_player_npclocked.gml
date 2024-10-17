function scr_player_npclocked() //scr_player_npclocked
{
    hsp = 0
    movespeed = 0
    landAnim = false
    if ((!calmroom[room]) || character != "P")
        sprite_index = spr_idle
    else
        sprite_index = spr_player_idlecalmer
    image_speed = 0.35
}

