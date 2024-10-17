function scr_player_ladder() //scr_player_ladder
{
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    turning = 0
    jumpstop = 0
    movespeed = 0
    hsp = 0
    if input_check("up")
    {
        sprite_index = spr_laddermove
        vsp = -10
        image_speed = 0.35
    }
    else if input_check("down")
    {
        sprite_index = spr_ladderdown
        vsp = 12
        image_speed = 0.35
    }
    else
    {
        sprite_index = spr_Ladder
        vsp = 0
        if (character == "G")
            image_speed = 0
    }
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    machhitAnim = 0
    if (!(place_meeting(x, y, obj_ladder)))
    {
        landAnim = 0
        jumpAnim = 0
        state = (0 << 0)
        image_index = 0
        vsp = 0
        if (character == "G")
            image_speed = 0.35
    }
    if input_check_pressed("jump")
    {
        sprite_index = spr_jump
        if (global.currentpowerup == (1 << 0))
            sprite_index = spr_shotgunjump
        ladderbuffer = 20
        jumpAnim = 1
        state = (36 << 0)
        vsp = -9
        image_index = 0
        if (character == "G")
            image_speed = 0.35
    }
    if (input_check("down") && grounded && (!(place_meeting(x, y, obj_platform))))
    {
        state = (0 << 0)
        image_index = 0
    }
    if (sprite_index == spr_laddermove && (floor(image_index) == 3 || floor(image_index) == 7) && steppy == 0)
    {
        instance_create_depth(x, (y + 16), 0, obj_cloudeffect)
        scr_fmod_soundeffectONESHOT("event:/sfx/player/step", x, y)
        steppy = 1
    }
    if (sprite_index == spr_laddermove && floor(image_index) != 3 && floor(image_index) != 7)
        steppy = 0
}

