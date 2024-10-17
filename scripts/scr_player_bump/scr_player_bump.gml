function scr_player_bump() //scr_player_bump
{
    movespeed = 0
    mach2 = 0
    start_running = 1
    alarm[4] = 14
    momemtum = 0
    if (sprite_index == spr_wallsplat)
        movespeed = 0
    if (grounded && vsp > 0 && sprite_index != spr_hitwall)
        hsp = 0
    if (grounded && vsp >= 0 && sprite_index == spr_hitwall && abs(hsp) > 0)
        hsp = lerp(hsp, 0, 0.1)
    if (sprite_index == spr_rockethitwall && grounded && vsp > 0)
        state = (0 << 0)
    if (sprite_index == spr_tumbleend)
    {
        if (!grounded)
            image_index = 0
    }
    if (sprite_index == spr_wallsplat)
    {
        vsp = 0
        hsp = 0
    }
    if (floor(image_index) == (image_number - 1) && sprite_index != spr_rockethitwall)
    {
        state = (grounded ? (0 << 0) : (36 << 0))
        if (state != (0 << 0))
            sprite_index = spr_fall
        return;
    }
    if (sprite_index != spr_player_catched && sprite_index != spr_tumbleend && sprite_index != spr_hitwall && sprite_index != spr_rockethitwall && sprite_index != spr_wallsplat)
        sprite_index = spr_bump
    if (sprite_index != spr_wallsplat)
        image_speed = 0.35
    else
        image_speed = 0.4
}

