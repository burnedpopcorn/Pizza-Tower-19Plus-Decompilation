function scr_enemy_idle() //scr_enemy_idle
{
    if (grounded && vsp > 1)
    {
        instance_create_depth(x, y, 0, obj_landcloud)
        image_index = 0
    }
    if (!((sprite_index == spr_forknight_eating && object_index == obj_forknight)))
    {
        if (scaredbuffer > 0)
            scaredbuffer--
        if (floor(image_index) == (image_number - 1))
        {
            switch sprite_index
            {
                case spr_forknight_turn:
                case spr_slimeturn:
                    sprite_index = walkspr
                    state = 100
                    break
            }

            if (sprite_index == scaredspr && scaredbuffer <= 0)
            {
                if (object_index != obj_ancho)
                {
                    if (vsp >= 0 && grounded)
                        state = 100
                }
                else
                    state = 100
            }
        }
    }
    if (grounded && vsp >= 0)
        hsp = 0
    else
        hsp = Approach(hsp, 0, 0.1)
    image_speed = 0.35
}

