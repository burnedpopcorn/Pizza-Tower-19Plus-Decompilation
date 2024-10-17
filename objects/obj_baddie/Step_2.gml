if killed
    instance_destroy()
if (stuntouchbuffer > 0)
    stuntouchbuffer--
if (stuntouchbuffer <= 0)
    stuntouchbuffer = 0
if (state != 104 || (!instance_exists(pummelled)) || (!pummelled.pummelpunch))
{
    pummelled = -4
    if (state != 107)
        depth = -2
}
else
{
    vsp = 0
    hsp = 0
    var _ray = fire_ray(pummelled.x, pummelled.y, (pummelled.x + pummelled.xscale * 60), (pummelled.y - 3), 1, -4, -4, mask_index)
    x = _ray.x
    y = _ray.y
    if (state != 107 || (state == 107 && grabbedby.sprite_index != grabbedby.spr_piledriver))
        depth = -6
}
if (state == 104 && sprite_index == spr_dead && hsp != 0)
{
    if (chargeeffectID == -4)
    {
        with (instance_create_depth(x, y, (depth - 1), obj_enemychargeeffect))
        {
            ID = other.id
            other.chargeeffectID = id
        }
    }
}
if (state != 107)
    image_yscale = 1
if (insupertaunt && obj_player.sprite_index != obj_player.spr_supertaunt1 && obj_player.sprite_index != obj_player.spr_supertaunt2 && obj_player.sprite_index != obj_player.spr_supertaunt3 && obj_player.sprite_index != obj_player.spr_supertaunt4)
    instance_destroy()
scr_enemy_heat()
if (y > (room_height + 400) && (!persistent))
    instance_destroy()
if place_meeting(x, (y + 1), obj_current)
    killed = 1
persistent = (state == 107 || pummelled != -4)
if (state != 107)
    scr_collide_enemy()
