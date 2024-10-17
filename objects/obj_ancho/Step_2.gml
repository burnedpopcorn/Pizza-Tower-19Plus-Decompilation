prevy = y
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
if (state == 300)
    return;
if (state != 104)
    birdcreated = 0
if (state == 100)
{
    if (y != attackpos && y == prevy)
    {
        var _raycheck = fire_ray(x, y, x, attackpos, 1, -4, -4, mask_index)
        if (!_raycheck.clear)
            attackpos = _raycheck.y
    }
    if (y > attackpos || (!(scr_solid(x, (y + 1)))))
        y = Approach(y, attackpos, 1)
}
if (state == 104)
    grav = 0.5
else
    grav = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
scr_escapeenemy()
var __player = instance_nearest(x, y, obj_player)
if (__player.x > (x - 400) && __player.x < (x + 400) && y <= (__player.y + 60) && y >= (__player.y - 60))
{
    if (state != 92 && state != 94 && __player.state == (66 << 0))
    {
        state = 92
        sprite_index = scaredspr
        if (x != __player.x)
            image_xscale = (-(sign(x - __player.x)))
    }
}
if (sprite_index == spr_ancho_chargestart && floor(image_index) == (image_number - 1))
{
    if (hitboxcreate == 0 && visible == 1 && state == 94)
    {
        hitboxcreate = 1
        with (instance_create_depth(x, y, 0, obj_forkhitbox))
            ID = other.id
    }
    sprite_index = spr_ancho_charge
    movespeed = 10
}
var _cancharge = y == attackpos
if (x != __player.x && _cancharge && visible)
{
    if (__player.x > (x - 200) && __player.x < (x + 200) && y <= (__player.y + 50) && y >= (__player.y - 50))
    {
        if (state == 100)
        {
            image_index = 0
            image_xscale = (-(sign(x - __player.x)))
            state = 94
            sprite_index = spr_ancho_chargestart
            scr_fmod_soundeffectONESHOT("event:/sfx/enemy/charge", x, y)
        }
    }
    if (__player.x > (x - 200) && __player.x < (x + 200) && y <= (__player.y + 200) && y >= (__player.y - 200))
    {
        if (state != 94 && state != 92 && global.stylethreshold >= 2 && __player.state != (40 << 0) && (!scr_transformationcheck()))
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
            charging = true
            scr_fmod_soundeffectONESHOT("event:/sfx/enemy/charge", x, y)
            state = 94
            movespeed = 0
            sprite_index = spr_ancho_rage1
            image_index = 0
            if (sign(__player.x - x) != 0)
                image_xscale = sign(__player.x - x)
        }
    }
}
if (state == 104 || state == 100)
    movespeed = 0
if (state != 104)
    thrown = 0
if (boundbox == 0)
{
    with (instance_create_depth(x, y, 0, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.mask_index
        baddieID = other.id
        other.boundbox = 1
    }
}
