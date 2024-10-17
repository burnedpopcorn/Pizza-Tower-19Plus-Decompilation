switch sprite_index
{
    case spr_secretportal_spawnopen:
        with (obj_heataura)
            visible = false
        event_perform(ev_other, ev_room_start)
        waitbuffer = 80
        drop = false
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_secretportal_spawnidle
            with (obj_player)
            {
                if (tauntstoredstate != (18 << 0) && tauntstoredstate != (13 << 0) && tauntstoredstate != (115 << 0) && tauntstoredstate != (5 << 0))
                {
                    visible = true
                    cutscene = false
                    sprite_index = spr_bodyslamstart
                    image_index = 0
                    state = (51 << 0)
                    vsp = (character == "P" ? -5 : -7)
                }
                else
                {
                    if (state == (18 << 0))
                        hsp = 0
                    sprite_index = tauntstoredsprite
                }
            }
        }
        break
    case spr_secretportal_spawnidle:
        if (!drop)
        {
            with (obj_heataura)
                visible = false
            with (obj_player)
            {
                x = other.x
                y = other.y - 10
                visible = true
                hsp = 0
                movespeed = 0
                vsp = 10
                scale_xs = Approach(scale_xs, 1, 0.05)
                scale_ys = Approach(scale_ys, 1, 0.05)
                fallinganimation = 0
                if (scale_xs == 1)
                    other.drop = true
                if other.drop
                {
                    enteringsecret = false
                    if (tauntstoredstate == (18 << 0) || tauntstoredstate == (13 << 0) || tauntstoredstate == (115 << 0) || tauntstoredstate == (5 << 0))
                    {
                        state = tauntstoredstate
                        movespeed = tauntstoredmovespeed
                        hsp = tauntstoredhsp
                        sprite_index = tauntstoredsprite
                        image_index = tauntstoredimageindex
                    }
                    switch state
                    {
                        case (13 << 0):
                            state = (18 << 0)
                            sprite_index = spr_knightpepfall
                            hsp = 0
                            movespeed = 0
                            break
                        case (18 << 0):
                            hsp = 0
                            movespeed = 0
                            break
                        case (5 << 0):
                            if (sprite_index == spr_player_firemouthdash)
                            {
                                hsp = 0
                                movespeed = 0
                                sprite_index = spr_player_firemouthidle
                            }
                            break
                    }

                }
            }
        }
        if drop
        {
            if (waitbuffer > 0)
                waitbuffer--
            else
            {
                sprite_index = spr_secretportal_spawnclose
                image_index = 0
            }
        }
        break
    case spr_secretportal_spawnclose:
        if (floor(image_index) == (image_number - 1))
            instance_destroy()
        break
}

