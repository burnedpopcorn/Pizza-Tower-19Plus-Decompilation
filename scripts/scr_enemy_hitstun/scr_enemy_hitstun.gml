function scr_enemy_hitstun() //scr_enemy_hitstun
{
    if (hitter <= 0)
    {
        movespeed = hitstunstoredmovespeed
        hsp = hitstunstoredhsp
        vsp = hitstunstoredvsp
        sprite_index = hitstunstoredsprite
        state = hitstunstoredstate
        image_speed = hitstunstoredimagespeed
    }
    if (hitter > 0)
    {
        image_speed = 0
        hsp = 0
        vsp = 0
        hitter--
    }
    if killed
        instance_destroy()
}

