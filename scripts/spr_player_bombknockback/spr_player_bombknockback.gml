function scr_player_bombknockback() //scr_player_bombknockback
{
    hsp = (-xscale) * movespeed
    if grounded
    {
        sprite_index = spr_land
        image_index = 0
        landAnim = true
        state = (0 << 0)
    }
    sprite_index = spr_rockethitwall
    image_speed = 0.35
}

