function scr_player_freefall() //scr_player_freefall
{
    collide_destructibles = function(argument0, argument1) //anon@58@scr_player_freefall_scr_player_freefall
    {
        if (argument1 >= 0)
            scr_destroy_vertical(argument1, ((1 << 0) * (character == "M" && freefallsmash > 10)))
    }

    hit_vertical = function(argument0) //anon@207@scr_player_freefall_scr_player_freefall
    {
        if (argument0 >= 0 && bodyslamvsp > 0)
        {
            scr_destroy_vertical(argument0, ((1 << 0) * (freefallsmash > 10)))
            freefallsmash = 0
            combo = 0
            bounce = 0
            freefallstart = 0
            image_index = 0
            jumpAnim = 1
            jumpstop = 0
            if (sprite_index == spr_player_firemoveend)
            {
                state = (53 << 0)
                sprite_index = spr_bodyslamland
            }
            else
            {
                if (assflingspeed > 0 && input_check("dash"))
                {
                    state = (66 << 0)
                    var _dir = input_check_opposing("left", "right")
                    if (_dir != 0)
                        xscale = _dir
                    movespeed = assflingspeed
                    if (movespeed < 25)
                        movespeed += 2
                }
                else
                {
                    if (sprite_index != spr_player_poundcancel1)
                    {
                        if (global.currentpowerup != (1 << 0))
                            sprite_index = spr_bodyslamland
                        else
                            sprite_index = spr_shotgunjump2
                    }
                    else
                        sprite_index = spr_player_poundcancel2
                    state = (53 << 0)
                }
                if (character == "S" && input_check("dash"))
                {
                    state = (45 << 0)
                    if (movespeed < 10)
                        movespeed = 10
                    vsp = 0
                    sprite_index = spr_crouchslip
                    instance_create_depth(x, y, -99, obj_shoulderbashcrazyrunothereffect)
                }
            }
            instance_create_depth(x, y, 0, obj_landcloud)
            if (!scr_slope())
            {
                instance_create_depth(x, y, (depth + 1), obj_slamcloud)
                scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
                if (!((assflingspeed > 0 && input_check("dash"))))
                {
                    if instance_exists(obj_baddie)
                    {
                        with (obj_baddie)
                        {
                            if (grounded && visible && bbox_in_camera(1, id))
                            {
                                vsp = -11
                                hsp = 0
                                stunned = 200
                                state = 104
                            }
                        }
                    }
                    if instance_exists(obj_slipnslide)
                    {
                        with (obj_slipnslide)
                        {
                            if (grounded && baddieID != noone && bbox_in_camera(1, id))
                            {
                                instance_destroy()
                                with (instance_create_depth(x, y, -100, obj_baddiedead))
                                    sprite_index = other.sprite_index
                            }
                        }
                    }
                }
                gamepadvibrate(0.7, 0, 15)
                camera_shake(5, 15)
            }
            else if (!((assflingspeed > 0 && input_check("dash"))))
            {
                if (character != "N" || (character == "N" && (!pogo)))
                {
                    instance_create_depth(x, y, 0, obj_jumpdust)
                    flash = 1
                    state = (23 << 0)
                    vsp = 10
                    movespeed = fallspeed / 2
                    with (instance_place((x + xscale), (y + 1), obj_slope))
                        other.xscale = (-sign(image_xscale))
                }
                else
                {
                    instance_create_depth(x, y, 0, obj_jumpdust)
                    flash = 1
                    grav = 0.5
                    sprite_index = spr_crouchslip
                    machhitAnim = 0
                    state = (45 << 0)
                    vsp = 10
                    movespeed = fallspeed / 2
                    with (instance_place((x + xscale), (y + 1), obj_slope))
                        other.xscale = (-sign(image_xscale))
                }
            }
        }
    }

    if (sprite_index == spr_bodyslamstart && floor(image_index) == (image_number - 1))
        sprite_index = spr_bodyslamfall
    landAnim = 1
    move = input_check_opposing("left", "right")
    vsp = bodyslamvsp
    if ((!grounded) && vsp > 1)
        fallspeed = vsp
    if (bodyslamvsp < 25)
    {
        if (sprite_index != spr_player_poundcancel1)
            bodyslamvsp += 0.5
        else
            bodyslamvsp += 0.7
    }
    freefallsmash++
    if (steppy > 0)
        steppy--
    else
    {
        instance_create_depth((x + (irandom_range(-25, 25))), (y + (irandom_range(-10, 35))), 1, obj_cloudeffect)
        steppy = 8
    }
    if ((!grounded) && sprite_index != spr_rockethitwall)
    {
        if (!momemtum)
            hsp = move * movespeed
        else
            hsp = xscale * movespeed
        if (move != xscale && momemtum && movespeed != 0)
            movespeed = Approach(movespeed, 0, 0.05)
        if ((move == 0 && (!momemtum)) || scr_solid((x + hsp), y))
        {
            movespeed = 0
            mach2 = 0
        }
        if (move == (-xscale))
            momemtum = 0
        if (movespeed <= 0 && momemtum)
            momemtum = 0
        if (move != 0 && movespeed < 7)
            movespeed += 0.25
        if (movespeed > 7)
            movespeed = Approach(movespeed, 0, 0.05)
        if ((!momemtum) && scr_solid((x + move), y) && move == xscale)
            movespeed = 0
        if (dir != xscale && (!momemtum))
        {
            mach2 = 0
            dir = xscale
            movespeed = 0
        }
        if (move == (-xscale) && (!momemtum))
        {
            mach2 = 0
            movespeed = 0
        }
        if (move != 0)
            xscale = move
        if (sprite_index == spr_player_poundcancel1 && character == "N")
        {
            if (input_buffer_attack < 8)
            {
                input_buffer_attack = 8
                xscale = lastdir
                movespeed = 12
                if (vsp > -5)
                    vsp = -5
                state = (47 << 0)
                sprite_index = spr_mach2jump
                instance_create_depth(x, y, 0, obj_shoulderbashcrazyrunothereffect)
                godown = 0
            }
        }
    }
    if (freefallsmash > 10 && (!instance_exists(obj_superslameffect)))
    {
        with (instance_create_depth(x, y, 0, obj_superslameffect))
        {
            playerid = other.playerobj
            other.superslameffectid = id
        }
    }
    blurafterimageeffect(3, 0.05)
    image_speed = 0.35
}

