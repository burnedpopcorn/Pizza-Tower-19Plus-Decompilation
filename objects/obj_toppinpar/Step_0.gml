if (obj_player.state == (110 << 0) || room == rank_room || room == timesuproom)
    visible = false
else
    visible = obj_player.visible
if taunting
{
    image_speed = 0
    if (!taunted)
    {
        sprite_index = tauntspr
        image_index = irandom(2)
        if (!instance_exists(tauntid))
        {
            with (instance_create_depth(x, y, (depth + 1), obj_taunteffect))
            {
                other.tauntid = id
                sprite_index = spr_tinytaunt
            }
        }
        taunted = true
    }
}
