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
if (state == 300)
    return;
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
if (state == 100)
    state = 92
if (state != 104)
    thrown = 0
scr_escapeenemy()
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
