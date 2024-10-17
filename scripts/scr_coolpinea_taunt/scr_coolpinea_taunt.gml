function scr_coolpinea_taunt() //scr_coolpinea_taunt
{
    hsp = 0
    vsp = 0
    taunttimer--
    if (taunttimer <= 0)
        state = 100
    image_speed = 0
}

