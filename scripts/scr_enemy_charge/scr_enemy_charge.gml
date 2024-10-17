function scr_enemy_charge() //scr_enemy_charge
{
    switch object_index
    {
        case obj_fencer:
            if (grounded || (grounded && (!(place_meeting(x, y, obj_platform)))))
                hsp = image_xscale * movespeed
            else
                hsp = 0
            if (sprite_index == spr_fencer_rage)
            {
                if (floor(image_index) == 0)
                {
                    for (var i = 0; i < 4; i++)
                    {
                        with (instance_create_depth(x, y, 0, obj_baddiemach3effect))
                        {
                            baddieid = other.id
                            image_index = other.image_index
                            image_xscale = other.image_xscale
                            sprite_index = other.sprite_index
                            alpha = 0.5
                            alarm[0] = 8
                            if (i <= 1)
                                hspeed = 4 - 8 * (i == 1)
                            else
                                vspeed = 4 - 8 * (i == 3)
                        }
                    }
                }
                if floor(image_index == 7)
                {
                    movespeed = 7
                    toomuchalarm1 = 6
                    with (instance_create_depth(x, y, 0, obj_baddiemach3effect))
                    {
                        baddieid = other.id
                        image_index = other.image_index - 1
                        image_xscale = other.image_xscale
                        sprite_index = other.sprite_index
                    }
                }
                if (floor(image_index) == (image_number - 1))
                {
                    state = 94
                    movespeed = 5
                    vsp = -7
                    sprite_index = spr_fencer_chargestart
                }
            }
            if (place_meeting((x + hsp), y, obj_hallway) || (scr_solid((x + image_xscale), y) && (!(place_meeting((x + image_xscale), y, obj_slope))) && (!(place_meeting((x + image_xscale), y, obj_destructibles)))))
                image_xscale *= -1
            with (instance_place((x + hsp), y, obj_destructibles))
                instance_destroy()
            break
        case obj_ancho:
            if (sprite_index != spr_ancho_rage1 && sprite_index != spr_ancho_rage2 && sprite_index != spr_ancho_rage3)
            {
                hsp = image_xscale * movespeed
                if place_meeting((x + hsp), y, obj_solid)
                {
                    state = 104
                    stunned = 100
                }
            }
            else
            {
                if (sprite_index == spr_ancho_rage1 && floor(image_index) == (image_number - 1))
                {
                    sprite_index = spr_ancho_rage2
                    image_index = 0
                    vsp = 12
                    toomuchalarm1 = 6
                    with (instance_create_depth(x, y, 0, obj_baddiemach3effect))
                    {
                        baddieid = other.id
                        image_index = other.image_index - 1
                        image_xscale = other.image_xscale
                        sprite_index = other.sprite_index
                    }
                    with (instance_create_depth(x, y, 0, obj_forkhitbox))
                    {
                        ID = other.id
                        sprite_index = spr_ancho_rage2
                        image_xscale = other.image_xscale
                    }
                }
                if (sprite_index == spr_ancho_rage2 && grounded && vsp >= 0)
                {
                    sprite_index = spr_ancho_rage3
                    image_index = 0
                    scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
                    camera_shake(5, 10)
                }
                if (sprite_index == spr_ancho_rage3 && floor(image_index) == (image_number - 1))
                {
                    sprite_index = spr_ancho
                    image_index = 0
                    state = 100
                }
            }
            break
        case obj_cheeseslime:
            hsp = image_xscale * movespeed
            if (sprite_index == spr_slime_rage)
            {
                if (floor(image_index) == 0)
                {
                    for (i = 0; i < 4; i++)
                    {
                        with (instance_create_depth(x, y, 0, obj_baddiemach3effect))
                        {
                            baddieid = other.id
                            image_index = other.image_index
                            image_xscale = other.image_xscale
                            sprite_index = other.sprite_index
                            alpha = 0.5
                            alarm[0] = 8
                            if (i <= 1)
                                hspeed = 4 - 8 * (i == 1)
                            else
                                vspeed = 4 - 8 * (i == 3)
                        }
                    }
                }
                if (floor(image_index) < 9)
                {
                    movespeed = 0
                    hsp = 0
                }
                if (floor(image_index) >= 9)
                    movespeed = 8
                if (floor(image_index) == 9)
                {
                    with (instance_create_depth(x, y, 0, obj_forkhitbox))
                    {
                        ID = other.id
                        sprite_index = spr_forkhitbox
                        image_xscale = other.image_xscale
                    }
                    toomuchalarm1 = 6
                    with (instance_create_depth(x, y, 0, obj_baddiemach3effect))
                    {
                        baddieid = other.id
                        image_index = other.image_index - 1
                        image_xscale = other.image_xscale
                        sprite_index = other.sprite_index
                    }
                }
                if (floor(image_index) == (image_number - 1))
                {
                    state = 100
                    sprite_index = spr_slimemove
                    image_index = 0
                    movespeed = 1
                    charging = false
                }
                bombreset = 100
                charging = false
                image_speed = 0.35
            }
            break
        case obj_forknight:
            hsp = image_xscale * movespeed
            if (sprite_index == spr_forknight_rageloop || sprite_index == spr_forknight_ragestart)
            {
                if (sprite_index == spr_forknight_ragestart && floor(image_index) == 0)
                {
                    for (i = 0; i < 4; i++)
                    {
                        with (instance_create_depth(x, y, 0, obj_baddiemach3effect))
                        {
                            baddieid = other.id
                            image_index = other.image_index
                            image_xscale = other.image_xscale
                            sprite_index = other.sprite_index
                            alpha = 0.5
                            alarm[0] = 8
                            if (i <= 1)
                                hspeed = 4 - 8 * (i == 1)
                            else
                                vspeed = 4 - 8 * (i == 3)
                        }
                    }
                }
            }
            if (sprite_index == spr_forknight_ragestart)
            {
                movespeed = 0
                hsp = 0
            }
            if (sprite_index == spr_forknight_ragestart && floor(image_index) == (image_number - 1))
            {
                movespeed = 4 + global.stylethreshold
                sprite_index = spr_forknight_rageloop
                toomuchalarm1 = 6
                with (instance_create_depth(x, y, 0, obj_baddiemach3effect))
                {
                    baddieid = other.id
                    image_index = other.image_index - 1
                    image_xscale = other.image_xscale
                    sprite_index = other.sprite_index
                }
            }
            if (grounded && floor(image_index) == 1 && sprite_index == spr_forknight_rageloop)
            {
                with (instance_create_depth(x, y, 0, obj_slidecloud))
                    image_xscale = other.image_xscale
            }
            if ((sprite_index == spr_forknight_rageloop && place_meeting((x + hsp), y, obj_hallway)) || (scr_solid((x + 1), y) && (!(place_meeting((x + image_xscale), y, obj_slope))) && (!(place_meeting((x + image_xscale), y, obj_destructibles)))))
            {
                if (stunned < 100)
                    stunned = 100
                vsp = -8
                hsp = image_xscale * -5
                state = 104
                image_index = 0
                charging = false
            }
            if (sprite_index == spr_forknight_rageloop)
            {
                with (instance_place((x + hsp), y, obj_destructibles))
                    instance_destroy()
            }
            bombreset = 100
            charging = false
            image_speed = 0.6
            break
        case obj_minijohn:
            hsp = movespeed * image_xscale
            if (sprite_index == spr_minijohn_rage1)
            {
                movespeed = 0
                if (floor(image_index) == (image_number - 1))
                {
                    scr_fmod_soundeffectONESHOT("event:/sfx/enemy/minijohnpunch", x, y)
                    sprite_index = spr_minijohn_rage2
                    image_index = 0
                    movespeed = 7
                    with (instance_create_depth(x, y, 0, obj_forkhitbox))
                    {
                        sprite_index = spr_minijohn_ragehitbox
                        mask_index = spr_minijohn_ragehitbox
                        ID = other.id
                        hurttype = other.hurttype
                    }
                    toomuchalarm1 = 6
                    with (instance_create_depth(x, y, 0, obj_baddiemach3effect))
                    {
                        baddieid = other.id
                        image_index = other.image_index - 1
                        image_xscale = other.image_xscale
                        sprite_index = other.sprite_index
                    }
                }
            }
            if (sprite_index == spr_minijohn_rage2 && floor(image_index) == (image_number - 1))
            {
                movespeed = 4
                state = 108
                sprite_index = spr_minijohn_charge
                bombreset = 100
                charging = false
            }
            break
        case obj_weeniesquire:
            sprite_index = spr_weeniesquire_charge
            if (movespeed < 8)
                movespeed += 0.1
            hsp = image_xscale * movespeed
            with (instance_place((x + hsp), y, obj_destructibles))
                instance_destroy()
            if (place_meeting((x + hsp), y, obj_hallway) || (scr_solid((x + image_xscale), y) && (!(place_meeting((x + image_xscale), y, obj_slope))) && (!(place_meeting((x + image_xscale), y, obj_destructibles)))))
            {
                if (stunned < 100)
                    stunned = 100
                vsp = -6
                hsp = image_xscale * -5
                state = 104
                image_index = 0
                charging = false
                scr_fmod_soundeffectONESHOT("event:/sfx/enemy/hit", x, y)
            }
            break
        case obj_swedishmonkey:
            hsp = 0
            if (sprite_index == spr_swedishmonkey_rage1 && floor(image_index) == 6 && (!playedsnd))
            {
                scr_fmod_soundeffectONESHOT("event:/sfx/enemy/monkeygunpullout", x, y)
                playedsnd = true
            }
            if (sprite_index == spr_swedishmonkey_rage1 && floor(image_index) == (image_number - 1))
            {
                with (instance_create_depth((x + 78 * image_xscale), (y + 15), depth, obj_coconut))
                    image_xscale = other.image_xscale
                sprite_index = spr_swedishmonkey_rage2
                image_index = 0
                scr_fmod_soundeffectONESHOT("event:/sfx/enemy/monkeygunshoot", x, y)
            }
            if (sprite_index == spr_swedishmonkey_rage2 && floor(image_index) == (image_number - 1))
            {
                state = 100
                bombreset = 100
                playedsnd = false
            }
            break
    }

    if (object_index == obj_fencer || object_index == obj_cheeseslime || object_index == obj_forknight || object_index == obj_minijohn)
    {
        if (toomuchalarm1 > 0)
        {
            toomuchalarm1 -= 1
            if (toomuchalarm1 <= 0)
            {
                with (instance_create_depth(x, y, 0, obj_baddiemach3effect))
                {
                    baddieid = other.id
                    image_index = other.image_index - 1
                    image_xscale = other.image_xscale
                    sprite_index = other.sprite_index
                }
                toomuchalarm1 = 6
            }
        }
        if (global.stylethreshold < 3 || (object_index == obj_fencer && heatcharging != 60))
            toomuchalarm1 = 0
    }
}

