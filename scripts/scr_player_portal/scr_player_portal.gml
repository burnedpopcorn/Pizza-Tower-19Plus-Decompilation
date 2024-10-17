function scr_player_portal() //scr_player_portal
{
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_pizzaportalentrancestart)
    {
        instance_create_depth(x, y, 0, obj_pizzaportalfade)
        state = (36 << 0)
        sprite_index = spr_fall
        grav = 0.5
        hsp = 0
        movespeed = 0
    }
    restore_combo()
    mach2 = 0
}

