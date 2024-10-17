function scr_player_crouch() //scr_player_crouch
{
    var _crouchstartanim = spr_crouchstart
    var _crouchanim = spr_crouch
    var _crawlanim = spr_crawl
    if (global.currentpowerup == (1 << 0))
    {
        _crouchstartanim = spr_shotgungoduck
        _crouchanim = spr_shotgunduck
        _crawlanim = spr_shotguncrawl
    }
    movespeed = 4
    mask_index = spr_crouchmask
    move = input_check_opposing("left", "right")
    hsp = move * movespeed
    turning = 0
    if ((!grounded) && (!input_check_pressed("jump")))
    {
        jumpAnim = 0
        state = (44 << 0)
        movespeed = 4
        crouchAnim = 1
        image_index = 0
    }
    if (grounded && (!input_check("down")) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && (!input_check_pressed("jump")))
    {
        state = (0 << 0)
        movespeed = 0
        crouchAnim = 1
        jumpAnim = 1
        image_index = 0
        mask_index = spr_player_mask
    }
    if (crouchAnim == 0)
    {
        if (move == 0)
            sprite_index = _crouchanim
        if (move != 0)
            sprite_index = _crawlanim
    }
    if (crouchAnim == 1)
    {
        if (move == 0)
        {
            sprite_index = _crouchstartanim
            if (floor(image_index) == (image_number - 1))
                crouchAnim = 0
        }
    }
    if (move != 0)
    {
        xscale = move
        crouchAnim = 0
    }
    if (input_check_pressed("jump") && grounded && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && character != "S")
    {
        scr_fmod_soundeffect(char_jumpsnd, x, y)
        vsp = -8
        state = (44 << 0)
        movespeed = 4
        image_index = 0
        crouchAnim = 1
        jumpAnim = 1
    }
    image_speed = 0.45
}

