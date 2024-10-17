function scr_player_mach3() //scr_player_mach3
{
    collide_destructibles = function(argument0, argument1) //anon@56@scr_player_mach3_scr_player_mach3
    {
        var f = (1 << 0)
        if rocket
            f |= (16 << 0)
        scr_destroy_horizontal(argument0, f)
    }

    hit_vertical = function(argument0) //anon@204@scr_player_mach3_scr_player_mach3
    {
        if (argument0 < 0)
            scr_destroy_vertical(argument0)
    }

    hit_horizontal = function(argument0) //anon@288@scr_player_mach3_scr_player_mach3
    {
        if (((!grounded) || (grounded && scr_slope())) && (!rocket))
        {
            if (character != "P")
                sprite_index = spr_machclimbwall
            else if (character == "P")
                sprite_index = spr_player_climbwall
            wallspeed = movespeed
            wallclimbtime = 0
            state = (12 << 0)
        }
        else
        {
            if scr_bump_rat(argument0)
                return;
            scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
            scr_fmod_soundeffectONESHOT("event:/sfx/player/bump", x, y)
            camera_shake(20, 40)
            gamepadvibrate(0.7, 0, 15)
            with (obj_baddie)
            {
                if bbox_in_camera(1, id)
                {
                    stun = 1
                    alarm[0] = 200
                    ministun = 0
                    vsp = -5
                    hsp = 0
                }
            }
            image_speed = 0.35
            state = (49 << 0)
            mach2 = 0
            image_index = 0
            instance_create_depth((x + xscale * 10), (y + 10), 0, obj_bumpeffect)
            if (!rocket)
            {
                sprite_index = spr_hitwall
                flash = 0
                hsp = (movespeed < 16 ? (-3 * xscale) : (-6 * xscale))
                vsp = -4
            }
            else
            {
                sprite_index = spr_rockethitwall
                hsp = -6 * xscale
                vsp = -4
                flash = 1
                instance_create_depth(x, y, 0, obj_bombexplosion2)
            }
        }
    }

    snickmach3mode = 1
    if (sprite_index == spr_rocketstart)
    {
        vsp = 0
        hsp = 0
        movespeed = 0
    }
    if ((sprite_index == spr_rocketdashstart || sprite_index == spr_rocketstart) && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_rocketdash
        movespeed = 12
    }
    if (sprite_index == spr_rocketdash && grounded && sprite_index != spr_rocketrun)
        sprite_index = spr_rocketrun
    if (sprite_index == spr_rocketrun && (!grounded) && sprite_index != spr_rocketdash)
        sprite_index = spr_rocketdash
    if (sprite_index == spr_rocketdash || sprite_index == spr_rocketdashstart || sprite_index == spr_rocketstart || sprite_index == spr_sjumpcancel)
        image_speed = 0.35
    if (sprite_index == spr_mach2jump)
        image_speed = 0.65
    if (sprite_index == spr_rocketrun)
        image_speed = 0.5
    if (sprite_index == spr_rocketdashstart || sprite_index == spr_rocketdash || sprite_index == spr_rocketrun)
    {
        if input_check("up")
            vsp = -4.2
        else if input_check("down")
            vsp = 4.2
        else if ((!input_check("down")) && (!input_check("up")))
            vsp = 0
    }
    if input_check_pressed("jump")
        input_buffer_jump = 0
    hsp = xscale * movespeed
    mach2 = 100
    momemtum = 1
    move = input_check_opposing("left", "right")
    move2 = input_check_opposing_pressed("left", "right")
    if grounded
    {
        if (scr_slope_ext(x, (y + 1)) && vsp >= 0)
        {
            with (instance_place(x, (y + 1), obj_slope))
            {
                var slope_acceleration = abs(image_yscale) / abs(image_xscale)
                if (other.xscale == sign(image_xscale))
                {
                    if (other.sprite_index != other.spr_crazyrun && (!other.rocket))
                    {
                        if (other.movespeed > 10)
                            other.movespeed -= (0.1 * slope_acceleration)
                    }
                }
                else if (other.xscale == (-sign(image_xscale)))
                {
                    if (other.movespeed < 20)
                        other.movespeed += (0.25 * slope_acceleration)
                }
            }
        }
    }
    if (movespeed < 20 && move == xscale && sprite_index != spr_rocketstart)
        movespeed += (0.025 + conveyor)
    crouchslideAnim = 1
    if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5)
    {
        vsp /= 10
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && (grounded || coyotetime > 0) && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))) && (!rocket))
    {
        input_buffer_jump = 8
        grounded = false
        coyotetime = 0
        scr_fmod_soundeffect(char_jumpsnd, x, y)
        image_index = 0
        sprite_index = (character != "S" ? spr_mach3jump : spr_jump)
        vsp = -11
    }
    if longjumping
    {
        if (grounded && vsp >= 0 && (!input_check("dash")))
        {
            image_index = 0
            if (character == "P")
            {
                longjumpslideanim = 1
                sprite_index = spr_longjumpslidestart
                state = (45 << 0)
                rollbuffer = 0
            }
            else
                sprite_index = spr_mach4
        }
        if (grounded && vsp >= 0 && input_check("dash"))
            sprite_index = spr_mach4
    }
    if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
        sprite_index = (character != "N" ? spr_mach4 : spr_mach4)
    if (sprite_index == spr_Dashpad && floor(image_index) == (image_number - 1))
        sprite_index = spr_mach4
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit))
        sprite_index = spr_mach4
    if ((sprite_index == spr_mach2jump || sprite_index == spr_jump) && grounded && vsp > 0)
        sprite_index = spr_mach4
    if (sprite_index == spr_sjumpcancel && grounded && vsp > 0)
        sprite_index = spr_mach4
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_walljumpstart)
        sprite_index = spr_walljumpend
    if (movespeed > 16 && sprite_index != spr_crazyrun)
    {
        flash = 1
        sprite_index = spr_crazyrun
    }
    else if (movespeed <= 16 && sprite_index == spr_crazyrun)
        sprite_index = spr_mach4
    if (grounded && (sprite_index == spr_walljumpstart || sprite_index == spr_walljumpend))
        sprite_index = spr_mach4
    if (sprite_index == spr_crazyrun && (!instance_exists(crazyruneffectid)))
    {
        with (instance_create_depth(x, y, 0, obj_crazyrunothereffect))
        {
            playerid = other.playerobj
            other.crazyruneffectid = id
        }
    }
    if (sprite_index == spr_mach4 || sprite_index == spr_Dashpad || sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
        image_speed = 0.4
    if (sprite_index == spr_crazyrun)
    {
        image_speed = 0.6
        if (flamecloudbuffer > 0)
            flamecloudbuffer--
        else
        {
            flamecloudbuffer = 10
            with (instance_create_depth(x, y, (depth + 1), obj_flamecloud))
                image_xscale = other.xscale
        }
    }
    if (grounded && vsp >= 0 && input_check("superjump") && sprite_index != spr_Dashpad && (!rocket))
    {
        sprite_index = spr_superjumpprep
        state = (42 << 0)
        image_index = 0
    }
    if ((character == "P" || character == "N") && input_check("up") && canuppercut && (!grounded) && input_buffer_attack < 8)
    {
        input_buffer_attack = 8
        state = (75 << 0)
        sprite_index = spr_shoryukenstart
        image_index = 0
        if (hsp > 0)
            hsp = movespeed
        if (hsp < 0)
            hsp = (-movespeed)
        shoryukenvsp = -10
        canuppercut = 0
        scr_fmod_soundeffectONESHOT("event:/sfx/player/uppercut", x, y)
        with (instance_create_depth(x, y, 0, obj_highjumpcloud2))
            image_xscale = other.xscale
        jumpAnim = 1
        facehurt = 0
        armhurt = 0
        introscared = 0
    }
    if (sprite_index != spr_Dashpad && (!input_check("dash")) && grounded && vsp >= 0 && (!rocket) && (character != "N" || (character == "N" && (!pogo))))
    {
        sprite_index = spr_machslidestart
        scr_fmod_soundeffect(char_machbreaksnd, x, y)
        state = (48 << 0)
        image_index = 0
    }
    if (move == (-xscale) && grounded && (!rocket) && sprite_index != spr_Dashpad && (character != "N" || (character == "N" && (!pogo))))
    {
        scr_fmod_soundeffect(char_machturnsnd, x, y)
        sprite_index = spr_machslideboost3
        state = (48 << 0)
        image_index = 0
    }
    if ((!(place_meeting(x, y, obj_dashpad))) && input_check("down") && (!(place_meeting(x, y, obj_dashpad))))
    {
        if ((!rocket) && (character != "N" || (character == "N" && (!pogo))))
        {
            if grounded
            {
                with (instance_create_depth(x, y, 0, obj_jumpdust))
                    image_xscale = other.xscale
            }
            image_index = 0
            flash = 0
            if (character != "N")
            {
                state = (23 << 0)
                vsp = 10
            }
            else if grounded
                state = (23 << 0)
            if (!grounded)
                fmod_studio_event_instance_start(divesnd)
        }
    }
    if ((!instance_exists(chargeeffectid)) && sprite_index != spr_rocketstart)
    {
        with (instance_create_depth(x, y, 0, obj_chargeeffect))
        {
            playerid = other.playerobj
            other.chargeeffectid = id
        }
    }
    if ((!instance_exists(obj_superdashcloud)) && (!(place_meeting(x, (y + 1), obj_infestedwater))) && grounded && sprite_index != spr_rocketstart)
    {
        with (instance_create_depth(x, y, 0, obj_superdashcloud))
            image_xscale = other.xscale
    }
    if (place_meeting(x, (y + 1), obj_infestedwater) && (!instance_exists(obj_watereffect)) && (!rocket))
        instance_create_depth(x, y, (depth + 1), obj_watereffect)
    if (character != "S" && (!input_check("up")) && (!rocket) && input_buffer_attack < 8)
    {
        input_buffer_attack = 8
        if (global.currentbadge == (1 << 0))
        {
            if (!kungfumove)
            {
                kungfumove = true
                state = (91 << 0)
                scr_fmod_soundeffectONESHOT("event:/sfx/player/kungfu", x, y)
                if (movespeed < 10)
                    movespeed = 10
                if (vsp > 0)
                    vsp = 0
                if grounded
                    sprite_index = choose(spr_kungfu1, spr_kungfu2, spr_kungfu3)
                else
                    sprite_index = choose(spr_kungfuair1start, spr_kungfuair2start, spr_kungfuair3start)
                image_index = 0
            }
        }
        else
        {
            suplexmove = 1
            fmod_studio_event_instance_start(suplexdashsnd)
            state = (16 << 0)
            image_index = 0
            if (global.currentpowerup == (1 << 0))
                sprite_index = spr_shotgunsuplexdash
            else
                sprite_index = spr_suplexdash
            if (movespeed < 10)
                movespeed = 10
            inmach = 1
            if grounded
            {
                with (instance_create_depth(x, y, 0, obj_dashcloud2))
                    image_xscale = other.xscale
            }
            momemtum = 1
        }
    }
    if (input_check_pressed("shoot") && global.currentpowerup == (2 << 0))
    {
        if (!grounded)
            vsp = -6
        state = (74 << 0)
        sprite_index = spr_player_gunshoot
        image_index = 0
        with (instance_create_depth(x, (y + 7), 0, obj_pistolgunbullet))
        {
            if (!input_check("up"))
            {
                dir = xscale_angle(other.xscale)
                x += (10 * other.xscale)
            }
            else
            {
                dir = 90
                y -= 17
                other.sprite_index = spr_player_gunshootup
            }
            if (other.object_index == obj_player)
                playerid = 1
        }
        camera_shake(3, 3)
        scr_fmod_soundeffect(revolversnd, x, y)
    }
    throwmort()
    if (global.currentpowerup == (3 << 0) && (!mortjump) && input_check_pressed("jump") && (!grounded) && sprite_index != spr_player_mortdoublejump && sprite_index != spr_player_mortjump)
    {
        mortjump = 1
        momemtum = 1
        state = (36 << 0)
        stompAnim = 0
        sprite_index = spr_player_mortdoublejump
        image_index = 0
        vsp = -11
        jumpstop = 0
        jumpAnim = 1
        instance_destroy(obj_mortfollow)
    }
    if (!rocket)
        scr_playertaunt()
}

