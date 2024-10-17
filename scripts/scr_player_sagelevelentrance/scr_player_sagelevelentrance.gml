function scr_player_sagelevelentrance() //scr_player_sagelevelentrance
{
    facehurt = 1
    if (sprite_index == spr_slipbananimpact)
    {
        y += 20
        if (y >= roomstarty)
        {
            y = roomstarty
            image_index = 0
            sprite_index = spr_slipbanan3
            scr_fmod_soundeffectONESHOT("event:/sfx/misc/cymbalcrash", x, y)
            instance_create_depth(x, (y + 35), 0, obj_bombexplosion2)
            instance_create_depth(x, y, 0, obj_landcloud)
            gamepadvibrate(0.8, 0, 7)
        }
    }
    if (sprite_index == spr_slipbanan3 && floor(image_index) == (image_number - 1))
    {
        state = (0 << 0)
        vsp = 0
    }
    image_speed = 0.5
}

