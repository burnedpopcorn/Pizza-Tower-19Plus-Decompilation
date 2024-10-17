function scr_player_slapdash() //scr_player_slapdash
{
    landAnim = 0
    hsp = xscale * movespeed
    move = input_check_opposing("left", "right")
    momemtum = 1
    dir = xscale
    vsp = 0
    if (floor(image_index) < 3)
        movespeed = 0
    else if (floor(image_index) >= 3)
        movespeed = 10
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_slapdash)
    {
        image_speed = 0.35
        state = (47 << 0)
        vsp = -3
    }
    if (input_check("down") && grounded && vsp > 0)
    {
        grav = 0.5
        sprite_index = spr_crouchslip
        machhitAnim = 0
        state = (45 << 0)
        movespeed = 15
    }
    if (scr_solid((x + 1), y) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/player/bump", x, y)
        grav = 0.5
        movespeed = 0
        state = (49 << 0)
        hsp = -2.5
        vsp = -3
        mach2 = 0
        image_index = 0
        machslideAnim = 1
        machhitAnim = 0
        instance_create_depth((x + 10), (y + 10), 0, obj_bumpeffect)
    }
    if (scr_solid((x - 1), y) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/player/bump", x, y)
        grav = 0.5
        movespeed = 0
        state = (49 << 0)
        hsp = 2.5
        vsp = -3
        mach2 = 0
        image_index = 0
        machslideAnim = 1
        machhitAnim = 0
        instance_create_depth((x - 10), (y + 10), 0, obj_bumpeffect)
    }
    image_speed = 0.35
}

