function scr_player_forcedfall() //scr_player_forcedfall
{
    hsp = Approach(hsp, 0, 0.1)
    sprite_index = spr_machfreefall
    image_speed = 0.35
    if grounded
    {
        sprite_index = spr_land
        image_index = 0
        landAnim = true
        state = (0 << 0)
    }
}

