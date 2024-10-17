function scr_player_crouchslide() //scr_player_crouchslide
{
    move = input_check_opposing("left", "right")
    collide_destructibles = function(argument0, argument1) //anon@110@scr_player_crouchslide_scr_player_crouchslide
    {
        scr_destroy_horizontal(argument0)
    }

    hit_horizontal = function(argument0) //anon@186@scr_player_crouchslide_scr_player_crouchslide
    {
        if (sprite_index != spr_sjumpcancelstart && sprite_index != spr_sjumpcancel)
        {
            if grounded
            {
                state = (49 << 0)
                sprite_index = spr_wallsplat
                if (sign(argument0) != 0)
                    xscale = sign(argument0)
                gamepadvibrate(0.4, 0, 7)
                image_index = 0
                mach2 = 0
                movespeed = 0
                longjumpslideanim = 0
                scr_fmod_soundeffectONESHOT("event:/sfx/player/splat", x, y)
            }
            else
            {
                state = (43 << 0)
                longjumpslideanim = 0
            }
        }
    }

    if (character == "S")
        rollbuffer = 0
    if (sprite_index != spr_sjumpcancelstart && sprite_index != spr_sjumpcancel)
    {
        if (!longjumpslideanim)
            hsp = xscale * movespeed
        else
            hsp = longjumpspd
        if (rollbuffer > 0)
            rollbuffer--
        if (scr_slope_ext(x, (y + 1)) && vsp >= 0)
        {
            with (instance_place(x, (y + 1), obj_slope))
            {
                var slope_acceleration = abs(image_yscale) / abs(image_xscale)
                if (other.xscale == sign(image_xscale))
                {
                    if (other.movespeed > 12)
                    {
                        other.movespeed -= (0.3 * slope_acceleration)
                        if (other.movespeed <= 0)
                            other.xscale = (-sign(image_xscale))
                    }
                }
                else if (other.xscale == (-sign(image_xscale)))
                {
                    if (other.movespeed < 24)
                        other.movespeed += (0.3 * slope_acceleration)
                }
            }
        }
        if (((grounded && vsp >= 0 && (!longjumpslideanim)) || longjumpslideanim) && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && (((!input_check("down")) && (!longjumpslideanim)) || input_check("dash")))
        {
            if (rollbuffer <= 0 || longjumpslideanim)
            {
                image_index = 0
                if longjumpslideanim
                {
                    movespeed = abs(longjumpspd)
                    if (sign(longjumpspd) != 0)
                        xscale = sign(longjumpspd)
                    longjumping = 0
                }
                longjumpslideanim = 0
                timeuntilslide = 0
                state = (23 << 0)
                sprite_index = spr_machroll
            }
        }
        if input_check_pressed("jump")
            input_buffer_jump = 0
        if ((!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && input_buffer_jump < 8 && longjumpslideanim)
        {
            image_index = 0
            if (!input_check("attack"))
            {
                if (abs(longjumpspd) < 12)
                {
                    movespeed = abs(longjumpspd)
                    longjumping = 0
                    xscale = sign(longjumpspd)
                    state = (47 << 0)
                    input_buffer_jump = 8
                    grounded = false
                    coyotetime = 0
                    image_index = 0
                    sprite_index = spr_secondjump1
                    scr_fmod_soundeffect(char_jumpsnd, x, y)
                    instance_create_depth(x, y, 0, obj_highjumpcloud2)
                    vsp = -11
                }
                else if (abs(longjumpspd) >= 12)
                {
                    movespeed = abs(longjumpspd)
                    xscale = sign(longjumpspd)
                    longjumping = 0
                    state = (66 << 0)
                    input_buffer_jump = 8
                    grounded = false
                    coyotetime = 0
                    scr_fmod_soundeffect(char_jumpsnd, x, y)
                    image_index = 0
                    sprite_index = spr_mach3jump
                    vsp = -11
                }
            }
            else
            {
                longjumping = 1
                image_index = 0
                sprite_index = spr_longjumpstart
                vsp = -10
                if (move != 0)
                    longjumpspd += (0.85 * move)
                state = (47 << 0)
                input_buffer_jump = 8
                grounded = false
                coyotetime = 0
                scr_fmod_soundeffect(longjumpsnd, x, y)
                instance_create_depth(x, y, 0, obj_highjumpcloud2)
            }
            longjumpslideanim = 0
        }
        if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5 && (!stompAnim))
        {
            vsp /= 10
            jumpstop = 1
        }
        if ((!grounded) && slidetodive && input_check("down"))
        {
            sprite_index = spr_dive
            state = (23 << 0)
            vsp = 10
        }
        if (jumpAnim && floor(image_index) == (image_number - 1))
            jumpAnim = 0
        slidetodive = grounded
        if (sprite_index == spr_longjumpslidestart && floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_longjumpslide
            image_index = 0
        }
        if (vsp > 0)
        {
            if grounded
            {
                jumpAnim = 0
                if ((!longjumpslideanim) && sprite_index != spr_longjumpstart && sprite_index != spr_longjump && sprite_index != spr_longjumpslidestart && sprite_index != spr_longjumpslide && sprite_index != spr_player_breakdanceslide)
                    sprite_index = spr_crouchslip
            }
        }
        if (((!longjumpslideanim) && movespeed >= 12) || (longjumpslideanim && ((longjumpspd >= 12 && xscale == 1) || (longjumpspd <= -12 && xscale == -1))))
            blurafterimageeffect(3, 0.2)
        if ((!grounded) && (!longjumpslideanim))
        {
            if (input_check("up") && input_buffer_attack < 8)
            {
                input_buffer_attack = 8
                state = (75 << 0)
                sprite_index = spr_shoryukenstart
                image_index = 0
                if (hsp > 0)
                    hsp = movespeed
                if (hsp < 0)
                    hsp = (-movespeed)
                shoryukenvsp = -6
                canuppercut = 0
                scr_fmod_soundeffectONESHOT("event:/sfx/player/uppercut", x, y)
                with (instance_create_depth(x, y, 0, obj_highjumpcloud2))
                    image_xscale = other.xscale
                jumpAnim = 1
                facehurt = 0
                armhurt = 0
                introscared = 0
            }
            if (input_buffer_down < 8 && (!godown) && vsp < 10)
            {
                input_buffer_down = 8
                godown = 1
                vsp = 10
            }
        }
        mask_index = spr_crouchmask
        if (longjumpslideanim && sprite_index != spr_longjumpslidestart && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
        {
            landAnim = 0
            if grounded
                state = (43 << 0)
            else
                state = (0 << 0)
            longjumpslideanim = 0
        }
        if ((!instance_exists(obj_slidecloud)) && grounded && ((movespeed > 5 && (!longjumpslideanim)) || (longjumpspd > 5 && longjumpslideanim)))
        {
            with (instance_create_depth(x, y, 0, obj_slidecloud))
                image_xscale = other.xscale
        }
        image_speed = 0.35
    }
    else
    {
        hsp = xscale * movespeed
        move = input_check_opposing("left", "right")
        dir = xscale
        if (sprite_index == spr_sjumpcancelstart)
        {
            if (move != 0)
                xscale = move
            hsp = 0
            vsp = 0
            movespeed = 0
            image_speed = 0.5
        }
        if (sprite_index == spr_sjumpcancelstart && floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_sjumpcancel
            with (instance_create_depth(x, y, -99, obj_shoulderbashcrazyrunothereffect))
            {
                playerid = other.playerobj
                image_xscale = other.xscale
                other.shoulderbashcrazyrunothereffectid = id
            }
            repeat (3)
            {
                with (instance_create_depth(x, y, 10, obj_balleffect))
                {
                    hsp = (-(((random_range(1, 8)) * other.xscale)))
                    vsp = random_range(-1, -8)
                }
            }
            image_index = 0
            flash = 1
            movespeed = (character != "S" ? 13 : 20)
            if (character == "S")
                snicksupermode = 1
            state = (66 << 0)
            vsp = -4
            image_speed = 0.35
        }
    }
}

