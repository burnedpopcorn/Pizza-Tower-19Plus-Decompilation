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
scr_escapeenemy()
hurttype = 1
var __player = instance_nearest(x, y, obj_player)
if (x != __player.x && grounded)
{
    if (__player.x > (x - 400) && __player.x < (x + 400) && y <= (__player.y + 20) && y >= (__player.y - 20))
    {
        if (state == 100 && (!charging))
        {
            with (instance_create_depth(x, y, 0, obj_forkhitbox))
                ID = other.id
            charging = true
            state = 94
            vsp = -7
            movespeed = 1
            scr_fmod_soundeffectONESHOT("event:/sfx/enemy/charge", x, y)
        }
    }
}
if (state == 104 || state == 100)
{
    charging = 0
    movespeed = 0
}
if (flash && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
if ((!hitboxcreate) && visible && state == 100)
{
    hitboxcreate = true
    with (instance_create_depth(x, y, 0, obj_forkhitbox))
    {
        sprite_index = spr_weeniesquire_hitbox
        ID = other.id
        hurttype = other.hurttype
    }
}
if (state != 104)
    thrown = 0
if (!boundbox)
{
    boundbox = true
    with (instance_create_depth(x, y, 0, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        baddieID = other.id
    }
}
