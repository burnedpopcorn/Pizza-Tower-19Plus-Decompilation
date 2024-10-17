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

if (!snotty)
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
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
scr_enemy_scared()
scr_escapeenemy()
if (bombreset > 0)
    bombreset--
if (state != 94)
    movespeed = 1
var __player = instance_nearest(x, y, obj_player)
if (x != __player.x && grounded && bombreset == 0 && global.stylethreshold >= 2 && (!snotty))
{
    if (__player.state != (105 << 0) && __player.state != (66 << 0) && (!scr_transformationcheck()) && __player.x > (x - 400) && __player.x < (x + 400) && y <= (__player.y + 60) && y >= (__player.y - 60) && __player.grounded)
    {
        if (state == 100 && charging == 0)
        {
            charging = 1
            scr_fmod_soundeffectONESHOT("event:/sfx/enemy/charge", x, y)
            flash = 1
            state = 94
            sprite_index = spr_slime_rage
            if (__player.x != x)
                image_xscale = sign(__player.x - x)
            hsp = 0
            movespeed = 0
            bombreset = 100
            image_index = 0
        }
    }
}
if (state != 104)
    thrown = 0
if (boundbox == 0)
{
    with (instance_create_depth(x, y, 0, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        image_xscale = other.image_xscale
        image_yscale = other.image_yscale
        mask_index = other.mask_index
        baddieID = other.id
        other.boundbox = 1
    }
}
