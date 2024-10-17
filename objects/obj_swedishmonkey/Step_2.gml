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
    with (instance_create_depth(x, y, -1, obj_enemybird))
        ID = other.id
}
if (state != 104)
    birdcreated = 0
if (state != 94)
    playedsnd = false
if (state == 300)
    return;
scr_enemy_scared()
scr_escapeenemy()
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
if (bombreset > 0)
    bombreset--
if (state != 104)
    thrown = 0
if (bombreset == 0 && grounded && visible)
{
    if (state == 100)
    {
        if (global.stylethreshold < 2)
        {
            image_index = 0
            sprite_index = spr_swedishmonkey_eat
            state = 95
        }
        if (global.stylethreshold >= 2)
        {
            var __player = instance_nearest(x, y, obj_player)
            if (__player.state != (66 << 0) && (!scr_transformationcheck()) && __player.x > (x - 400) && __player.x < (x + 400) && y <= (__player.y + 30) && y >= (__player.y - 30))
            {
                image_xscale = (-(sign(x - __player.x)))
                sprite_index = spr_swedishmonkey_rage1
                image_index = 0
                flash = 1
                state = 94
                bombreset = 100
            }
        }
    }
}
if (boundbox == 0 && visible == 1)
{
    with (instance_create_depth(x, y, 0, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = spr_player_mask
        baddieID = other.id
        other.boundbox = 1
    }
}
