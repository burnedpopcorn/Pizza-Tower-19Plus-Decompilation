function scr_player_hitstun() //scr_player_hitstun
{
    image_speed = 0
    movespeed = 0
    hsp = 0
    vsp = 0
    if (hittimer <= 0)
    {
        hittimer = 0
        movespeed = hitstunstoredmovespeed
        hsp = hitstunstoredhsp
        vsp = hitstunstoredvsp
        if (hitstunstoredsprite != spr_player_hitstun1 && hitstunstoredsprite != spr_player_hitstun2 && hitstunstoredsprite != spr_player_hitstun3)
            sprite_index = hitstunstoredsprite
        else if (hitstunstoredsprite == spr_player_hitstun1 || hitstunstoredsprite == spr_player_hitstun2 || hitstunstoredsprite == spr_player_hitstun3)
        {
            jumpAnim = 1
            image_index = 0
            sprite_index = spr_player_jugglestart
        }
        state = hitstunstoredstate
        image_speed = hitstunstoredimagespeed
        if instance_exists(obj_bossdefeatflash)
            obj_bossdefeatflash.flashfade = 1
    }
    if (hittimer > 0)
    {
        hsp = 0
        vsp = 0
    }
    hittimer--
    if input_check_pressed("jump")
        input_buffer_jump = 0
    with (obj_baddie)
    {
        if (state != 300)
        {
            hitstunstoredmovespeed = movespeed
            hitstunstoredhsp = hsp
            hitstunstoredvsp = vsp
            hitstunstoredsprite = sprite_index
            hitstunstoredstate = state
            hitstunstoredimagespeed = image_speed
            state = 300
            hitter = other.hittimer
        }
    }
}

