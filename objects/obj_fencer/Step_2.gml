event_inherited()
switch state
{
    case 92:
        scr_enemy_idle()
        break
    case 94:
        scr_enemy_charge()
        break
    case 96:
        scr_enemy_turn()
        break
    case 100:
        scr_enemy_walk()
        break
    case 102:
        scr_enemy_land()
        break
    case 103:
        scr_enemy_hit()
        break
    case 104:
        scr_enemy_stun()
        break
    case 95:
        scr_enemy_throw()
        break
    case 107:
        scr_enemy_grabbed()
        break
    case 300:
        scr_enemy_hitstun()
        break
}

enemy_palettepoof()
if (state == 104 && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create_depth(x, y, 0, obj_enemybird))
        ID = other.id
}
if (state != 104)
    birdcreated = 0
if (state == 300)
    return;
scr_enemy_scared()
scr_escapeenemy()
hurttype = 1
if (state != 94)
    movespeed = 0
var __player = instance_nearest(x, y, obj_player)
if (x != __player.x && grounded)
{
    if (__player.x > (x - 300) && __player.x < (x + 300) && y <= (__player.y + 60) && y >= (__player.y - 60))
    {
        if ((global.stylethreshold < 2 && state == 100 && (!charging)) || (global.stylethreshold >= 2 && heatcharging == 0 && state != 104 && state != 107 && state != 92 && (!scr_transformationcheck())))
        {
            scr_fmod_soundeffectONESHOT("event:/sfx/enemy/charge", x, y)
            if (global.stylethreshold >= 2)
            {
                if (!heatcharging)
                {
                    with (instance_create_depth(x, y, 0, obj_forkhitbox))
                        ID = other.id
                    heatcharging = 60
                    charging = 1
                    state = 94
                    movespeed = 0
                    sprite_index = spr_fencer_rage
                    image_index = 0
                    image_xscale = sign(__player.x - x)
                    if (image_xscale == 0)
                        image_xscale = 1
                }
            }
            else if (global.stylethreshold < 2)
            {
                with (instance_create_depth(x, y, 0, obj_forkhitbox))
                {
                    ID = other.id
                    hurttype = 1
                }
                charging = 1
                state = 94
                movespeed = 5
                vsp = -6
                sprite_index = spr_fencer_chargestart
            }
        }
    }
}
if (state == 104 || state == 100)
{
    heatcharging = 0
    charging = 0
    movespeed = 0
}
if (heatcharging && sprite_index != spr_fencer_rage)
    heatcharging--
if (sprite_index == spr_fencer_chargestart && floor(image_index) == (image_number - 1))
    sprite_index = spr_fencer_charge
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
if (hitboxcreate == 0 && (state == 100 || state == 94))
{
    hitboxcreate = 1
    with (instance_create_depth(x, y, 0, obj_forkhitbox))
    {
        ID = other.id
        hurttype = 1
    }
}
if (state != 104)
    thrown = 0
if (boundbox == 0)
{
    with (instance_create_depth(x, y, 0, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
