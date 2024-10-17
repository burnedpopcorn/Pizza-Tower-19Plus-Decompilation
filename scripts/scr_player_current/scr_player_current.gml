function scr_player_current() //scr_player_current
{
    landAnim = 1
    movespeed = 20
    mach2 = 0
    if place_meeting(x, (y + 1), obj_current)
    {
        var dir = sign(instance_place(x, (y + 1), obj_current).image_xscale)
        hsp = 20 * dir
        xscale = dir
    }
    if (!(place_meeting(x, (y + 1), obj_current)))
    {
        state = (88 << 0)
        vsp = -7
        sprite_index = spr_slipbanan1
        image_index = 0
        scr_fmod_soundeffectONESHOT("event:/sfx/misc/slip", x, y)
        currentslip = 1
    }
    if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 7) && steppy == 0)
    {
        instance_create_depth(x, y, -3, obj_watereffect)
        steppy = 1
    }
    if (move != 0 && floor(image_index) != 3 && floor(image_index) != 7)
        steppy = 0
    image_speed = 0.35
}

