switch sprite_index
{
    case spr_cheesedragon_idle:
        attacktimer--
        if (attacktimer <= 0)
        {
            currentattack++
            currentattack %= array_length(attackcycle)
            scr_fmod_soundeffectONESHOT("event:/sfx/misc/dragonattack", x, y)
            if (attackcycle[currentattack] == (1 << 0))
            {
                if (!(bbox_in_camera(view_camera[1], id)))
                {
                    with (instance_create_depth(x, y, 0, obj_giantfireball))
                    {
                        alarm[0] = other.attacktime
                        heatseektimer = other.fireballheatseektime
                    }
                    fireball = true
                }
                sprite_index = spr_cheesedragon_flames
            }
            if (attackcycle[currentattack] == (0 << 0))
                sprite_index = spr_cheesedragon_stomp
            image_index = 0
            attacktimer = attackrate
        }
        break
    case spr_cheesedragon_stomp:
        if (floor(image_index) == 12 && (!stomped))
        {
            if bbox_in_camera(view_camera[1], id)
                camera_shake(10, 30)
            scr_fmod_soundeffectONESHOT("event:/sfx/misc/dragonslam", x, bbox_bottom)
            repeat brickwaveamount
            {
                with (instance_create_depth(-100, -100, 0, obj_dragonbrick))
                    alarm[0] = other.attacktime
            }
            stomped = true
        }
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_cheesedragon_idle
            stomped = false
        }
        break
    case spr_cheesedragon_flames:
        if fireball
        {
            if (!(bbox_in_camera(view_camera[1], id)))
            {
                image_index = 0
                if (!instance_exists(obj_giantfireball))
                    sprite_index = spr_cheesedragon_idle
            }
            else
                fireball = false
        }
        if (floor(image_index) >= 13 && floor(image_index) <= 26 && firetimer <= 0)
        {
            if (!vommited)
            {
                scr_fmod_soundeffectONESHOT("event:/sfx/misc/dragonvomit", x, y)
                vommited = true
            }
            with (flamehitbox)
            {
                if place_meeting(x, y, obj_player)
                    scr_hurtplayer(instance_place(x, y, obj_player), false)
                if place_meeting(x, y, obj_parryhitbox)
                {
                    var plrid = other.playerid
                    with (plrid)
                        parry()
                    instance_destroy()
                }
                image_xscale = other.image_xscale
                var _x = (image_xscale == 1 ? bbox_left : bbox_right)
                with (instance_create_depth(_x, (bbox_bottom - 32), 0, obj_dragonflame))
                {
                    hsp = (random_range(1, 11)) * (-other.image_xscale)
                    vsp = random_range(-1, -11)
                    scr_fmod_soundeffectONESHOT("event:/sfx/misc/dragonfirespurt", x, y)
                }
            }
            firetimer = irandom_range(4, 8)
        }
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_cheesedragon_idle
            fireball = false
            vommited = false
        }
        break
    case spr_cheesedragon_hurt:
        if (obj_player.state != (87 << 0))
        {
            add_combo()
            obj_drawcontroller.givetime = timereward
            if (!die)
            {
                sprite_index = spr_cheesedragon_goingup
                image_index = 0
            }
            else
            {
                instance_destroy()
                with (instance_create_depth(x, y, depth, obj_baddiedead))
                    sprite_index = spr_cheesedragon_hurt
            }
        }
        break
    case spr_cheesedragon_goingup:
        y -= 7
        if (!(bbox_in_camera(view_camera[1], id)))
            instance_destroy()
        break
}

if (firetimer > 0)
    firetimer--
