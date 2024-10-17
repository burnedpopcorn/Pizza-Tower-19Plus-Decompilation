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
    case 108:
        scr_enemy_chase()
        break
    case 300:
        scr_enemy_hitstun()
        break
}

enemy_palettepoof()
if (state == 104 && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create_depth(x, y, -1, obj_enemybird))
        ID = other.id
}
if (state != 104)
    birdcreated = 0
if (state == 300)
    return;
scr_escapeenemy()
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
hurttype = 0
if (state != 94)
    movespeed = 1
var __player = instance_nearest(x, y, obj_player)
if (state == 92 || state == 100)
{
    movespeed = 4
    if (__player.x != x)
        image_xscale = (-(sign(x - __player.x)))
    state = 108
}
if (hitboxcreate == 0 && state == 108 && __player.state != (66 << 0))
{
    hitboxcreate = 1
    with (instance_create_depth(x, y, 0, obj_minijohn_hitbox))
    {
        ID = other.id
        hurttype = other.hurttype
    }
}
if (x != __player.x && grounded && bombreset == 0 && global.stylethreshold >= 2)
{
    if (__player.state != (105 << 0) && __player.state != (66 << 0) && (!scr_transformationcheck()) && __player.x > (x - 250) && __player.x < (x + 250) && y <= (__player.y + 60) && y >= (__player.y - 60))
    {
        if (state == 108 && charging == 0)
        {
            image_xscale = (-(sign(x - __player.x)))
            sprite_index = spr_minijohn_rage1
            image_index = 0
            movespeed = 0
            charging = 1
            flash = 1
            state = 94
            hsp = 0
            bombreset = 100
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
    }
}
if (bombreset > 0)
    bombreset--
if (state != 104)
    thrown = 0
if (boundbox == 0)
{
    with (instance_create_depth(x, y, 0, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = spr_player_mask
        baddieID = other.id
        other.boundbox = 1
    }
}
