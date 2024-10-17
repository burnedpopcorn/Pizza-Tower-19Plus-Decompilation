function scr_player_hubeject() //scr_player_hubeject
{
    if (sprite_index == spr_slipbanan2)
    {
        y += 20
        if (y >= backtohubstarty)
        {
            y = backtohubstarty
            vsp = -8
            sprite_index = spr_slipbananimpact
            scr_fmod_soundeffectONESHOT("event:/sfx/misc/impact", x, y)
            instance_create_depth(x, y, 0, obj_landcloud)
            instance_create_depth((x + xscale * 4), (y + 35), 0, obj_bangeffect)
            gamepadvibrate(0.6, 0, 7)
        }
    }
    if (sprite_index == spr_slipbananimpact)
    {
        y += vsp
        vsp += grav
        if (y >= backtohubstarty)
        {
            y = backtohubstarty
            image_index = 0
            sprite_index = spr_slipbanan3
            scr_fmod_soundeffectONESHOT("event:/sfx/misc/cymbalcrash", x, y)
            instance_create_depth(x, y, 0, obj_landcloud)
            gamepadvibrate(0.4, 0, 7)
        }
    }
    if (sprite_index == spr_slipbanan3 && floor(image_index) == (image_number - 1))
    {
        state = (0 << 0)
        vsp = 0
    }
    image_speed = 0.35
}

