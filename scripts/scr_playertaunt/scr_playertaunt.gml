function scr_playertaunt() //scr_playertaunt
{
    if input_check_pressed("taunt")
    {
        if (global.currentbadge == (2 << 0))
        {
            state = (71 << 0)
            if (movespeed < 9)
                movespeed = 9
            breakdancedashtime = 35
            sprite_index = spr_player_breakdancestart
            image_index = 0
            scr_fmod_soundeffectONESHOT("event:/sfx/player/breakdance", x, y)
            dance = "breakdance"
        }
        else
        {
            taunting = 1
            taunttimer = 20
            tauntstoredmovespeed = movespeed
            tauntstoredsprite = sprite_index
            tauntstoredstate = state
            tauntstoredvsp = vsp + grav
            tauntstoredimagespeed = image_speed
            tauntstoredhsp = hsp
            tauntstoredimageindex = image_index
            state = (31 << 0)
            image_index = random_range(0, (sprite_get_number(spr_taunt) - 1))
            sprite_index = spr_taunt
            scr_fmod_soundeffect(tauntsnd, x, y)
            with (instance_create_depth(x, y, 0, obj_parryhitbox))
                playerid = other.playerobj
            with (instance_create_depth((x + hsp), (y + vsp), 1, obj_taunteffect))
                image_xscale = other.xscale
            with (obj_baddie)
            {
                if bbox_in_camera(1, id)
                {
                    if ((!thrown) && state != 95 && grounded)
                    {
                        if (stunned <= 0)
                            bombreset = 0
                        stunned = 0
                        scaredbuffer = 0
                    }
                }
            }
            with (obj_baddiespawner)
            {
                if ((!instance_exists(spawnedobject)) && (!((content == obj_bomb && (bomb || (obj_player.state == (19 << 0) && obj_player.bombspawnerid == id))))))
                    cooldown = 0
            }
        }
    }
}

