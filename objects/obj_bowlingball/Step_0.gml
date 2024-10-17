if (obj_player.x > (x - 8) && obj_player.x < (x + 8) && obj_player.y > y && obj_player.y < (y + 200) && (!falling))
{
    vsp = 15
    falling = 1
}
if falling
{
    sprite_index = spr_bowlingballfalling
    x += hsp
    y += vsp
    if (vsp < 30)
        vsp += grav
}
