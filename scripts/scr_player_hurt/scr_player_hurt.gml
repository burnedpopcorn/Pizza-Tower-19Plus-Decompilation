function scr_player_hurt() //scr_player_hurt
{
    hsp = xscale * movespeed
    freefallsmash = 0
    combo = 0
    mach2 = 0
    bounce = 0
    jumpAnim = 1
    dashAnim = 1
    if grounded
        landAnim = 0
    else
        landAnim = 1
    jumpstop = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    hurted = 1
    turning = 0
    pitfalltime = 10
    alarm[5] = 2
    alarm[7] = 50
    if (grounded && vsp > 0)
    {
        state = (0 << 0)
        movespeed = 0
    }
    if (sprite_index == spr_hurtjumpstart && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_hurtjump
        image_index = 0
    }
    if (scr_solid((x + hsp), y) && (!scr_slope()))
        movespeed = 0
    image_speed = 0.35
}

