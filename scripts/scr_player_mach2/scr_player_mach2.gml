function scr_player_mach2() //scr_player_mach2
{
    move2 = input_check_opposing_pressed("left", "right")
    move = input_check_opposing("left", "right")
    collide_destructibles = function(argument0, argument1) //anon@160@scr_player_mach2_scr_player_mach2
    {
        if (argument1 < 0)
            scr_destroy_vertical(argument1)
        scr_destroy_horizontal(argument0)
    }

    hit_horizontal = function(argument0) //anon@281@scr_player_mach2_scr_player_mach2
    {
        if (sign(argument0) != xscale)
        {
            state = (49 << 0)
            sprite_index = spr_wallsplat
            image_index = 0
            if (sign(argument0) != 0)
                xscale = sign(argument0)
            mach2 = 0
            gamepadvibrate(0.4, 0, 7)
            scr_fmod_soundeffectONESHOT("event:/sfx/player/splat", x, y)
            return;
        }
        if (((!grounded) || (grounded && scr_slope())) && (!rocket))
        {
            sprite_index = spr_player_climbwall
            wallspeed = ((!longjumping) ? movespeed : abs(longjumpspd))
            longjumping = 0
            longjumpspd = 0
            wallclimbtime = 0
            state = (12 << 0)
        }
        else
        {
            if scr_bump_rat(argument0)
                return;
            state = (49 << 0)
            sprite_index = spr_wallsplat
            image_index = 0
            mach2 = 0
            gamepadvibrate(0.4, 0, 7)
            scr_fmod_soundeffectONESHOT("event:/sfx/player/splat", x, y)
        }
    }

    snickmach2mode = 1
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if (!longjumping)
        hsp = xscale * movespeed
    else
        hsp = longjumpspd
    crouchslideAnim = 1
    if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5 && bumped == 0)
    {
        vsp /= 10
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && (can_jump || coyotetime > 0) && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))))
    {
        input_buffer_jump = 8
        grounded = false
        coyotetime = 0
        image_index = 0
        sprite_index = spr_secondjump1
        scr_fmod_soundeffect(char_jumpsnd, x, y)
        instance_create_depth(x, y, 0, obj_highjumpcloud2)
        if (character == "S")
        {
            jumpstop = 0
            state = (36 << 0)
            momemtum = 1
            sprite_index = spr_jump
        }
        vsp = -11
    }
    if ((can_jump || coyotetime > 0) && vsp > 0)
    {
        if (((!machpunchAnim) || (machpunchAnim && character == "S")) && sprite_index != spr_mach1 && sprite_index != spr_mach && sprite_index != spr_mach4 && sprite_index != spr_player_machhit && (!longjumping))
        {
            if (sprite_index != spr_player_machhit && sprite_index != spr_rollgetup)
                sprite_index = spr_mach
        }
        if (machpunchAnim && character != "S")
        {
            if (!punch)
                sprite_index = spr_machpunch1
            if punch
                sprite_index = spr_machpunch2
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_machpunch1)
            {
                punch = 1
                machpunchAnim = 0
            }
            if (floor(image_index) == (image_number - 1) && sprite_index == spr_machpunch2)
            {
                punch = 0
                machpunchAnim = 0
            }
        }
    }
    if ((!input_check("dash")) && grounded && vsp >= 0 && move != xscale && (!longjumping))
    {
        if (movespeed >= 8)
        {
            image_index = 0
            state = (48 << 0)
            scr_fmod_soundeffect(char_machbreaksnd, x, y)
            sprite_index = spr_machslidestart
        }
        else if (movespeed < 8)
            state = (0 << 0)
    }
    if ((!input_check("dash")) && grounded && vsp >= 0 && move == xscale && (!longjumping))
        state = (0 << 0)
    if longjumping
    {
        if (move != 0)
        {
            if (move == (-xscale))
            {
                if (xscale == -1 && longjumpspd < 12)
                    longjumpspd = Approach(longjumpspd, 12, 0.15)
                else if (xscale == 1 && longjumpspd > -12)
                    longjumpspd = Approach(longjumpspd, -12, 0.15)
            }
            if (move == xscale)
            {
                if (xscale == -1 && longjumpspd >= 0)
                    longjumpspd = Approach(longjumpspd, -12, 0.2)
                else if (xscale == 1 && longjumpspd <= 0)
                    longjumpspd = Approach(longjumpspd, 12, 0.2)
            }
        }
        if (grounded && vsp >= 0)
        {
            image_index = 0
            longjumpslideanim = 1
            sprite_index = spr_longjumpslidestart
            scr_fmod_soundeffectONESHOT("event:/sfx/player/step", x, y)
            state = (45 << 0)
            rollbuffer = 0
        }
    }
    if (sprite_index == spr_longjumpstart && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_longjump
        image_index = 0
    }
    if (sprite_index == spr_mach1 && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_mach
        image_index = 0
    }
    if (!grounded)
        machpunchAnim = 0
    if (grounded && vsp >= 0 && (!longjumping))
    {
        if (scr_slope_ext(x, (y + 1)) && vsp >= 0)
        {
            with (instance_place(x, (y + 1), obj_slope))
            {
                var slope_acceleration = abs(image_yscale) / abs(image_xscale)
                if (other.xscale == sign(image_xscale))
                {
                    if (other.movespeed > 8)
                        other.movespeed -= (0.1 * slope_acceleration)
                }
                else if (other.xscale == (-sign(image_xscale)))
                {
                    if (other.movespeed < 24)
                        other.movespeed += (0.25 * slope_acceleration)
                }
            }
        }
        if (movespeed < 12)
            movespeed += (0.1 + conveyor)
        if (movespeed >= 12 && movespeed < 20 && character == "S" && move == xscale)
            movespeed += (0.1 + conveyor)
        if ((abs(hsp) >= 12 && character != "S") || (character == "S" && abs(hsp) >= 12 && scr_slope_ext(x, (y + 1)) && vsp >= 0 && xscale == (-(sign(instance_place(x, (y + 1), obj_slope).image_xscale)))))
        {
            machhitAnim = 0
            state = (66 << 0)
            flash = 1
            if (sprite_index != spr_rollgetup && sprite_index != spr_Dashpad)
                sprite_index = spr_mach4
            with (instance_create_depth(x, y, 0, obj_jumpdust))
                image_xscale = other.xscale
        }
    }
    if ((!instance_exists(obj_dashcloud)) && grounded)
    {
        with (instance_create_depth(x, y, 0, obj_dashcloud))
            image_xscale = other.xscale
    }
    if (grounded && floor(image_index) == (image_number - 1) && sprite_index == spr_rollgetup)
        sprite_index = spr_mach
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_walljumpstart)
        sprite_index = spr_walljumpend
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_jugglestart)
        sprite_index = spr_mach2jump
    if ((!grounded) && sprite_index != spr_secondjump1 && sprite_index != spr_secondjump2 && sprite_index != spr_mach2jump && sprite_index != spr_kungfuair1 && sprite_index != spr_walljumpstart && sprite_index != spr_walljumpend && sprite_index != spr_player_jugglestart && (!longjumping))
        sprite_index = spr_secondjump2
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_secondjump1)
        sprite_index = spr_secondjump2
    if (input_check("down") && (!(place_meeting(x, y, obj_dashpad))) && candive)
    {
        if grounded
        {
            with (instance_create_depth(x, y, 0, obj_jumpdust))
                image_xscale = other.xscale
        }
        flash = 0
        if (character != "N")
            state = (23 << 0)
        else if grounded
            state = (23 << 0)
        image_index = 0
        vsp = 10
        if (!grounded)
            fmod_studio_event_instance_start(divesnd)
    }
    if (move == (-xscale) && grounded && vsp >= 0 && (!longjumping))
    {
        if (movespeed < 8)
        {
            momemtum = 0
            mach2 = 0
            movespeed = 6
            xscale = (-xscale)
        }
        else if (movespeed >= 8)
        {
            scr_fmod_soundeffect(char_machturnsnd, x, y)
            image_index = 0
            state = (48 << 0)
            sprite_index = spr_machslideboost
        }
    }
    if (sprite_index == spr_rollgetup)
        image_speed = 0.4
    else if (sprite_index != spr_longjumpstart && sprite_index != spr_longjump)
    {
        if (sprite_index != spr_walljumpstart && sprite_index != spr_walljumpend)
        {
            if (sprite_index != spr_mach)
                image_speed = 0.65
            else
                image_speed = 0.1 + (abs(movespeed / 24))
        }
        else
            image_speed = 0.45
    }
    else
        image_speed = 0.5
    if ((character == "P" || character == "N") && input_check("up") && input_buffer_attack < 8 && canuppercut)
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
    if (input_buffer_attack < 8 && character != "S" && (!input_check("up")))
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
            if (global.currentpowerup != (1 << 0))
                sprite_index = spr_suplexdash
            else
                sprite_index = spr_shotgunsuplexdash
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
    if (global.currentpowerup == (3 << 0) && (!mortjump) && input_check_pressed("jump") && (!grounded) && sprite_index != spr_player_mortdoublejump && sprite_index != spr_player_mortjump)
    {
        mortjump = 1
        state = (36 << 0)
        stompAnim = 0
        sprite_index = spr_player_mortdoublejump
        image_index = 0
        vsp = -11
        jumpstop = 0
        jumpAnim = 1
        momemtum = 1
        instance_destroy(obj_mortfollow)
    }
    throwmort()
    scr_playertaunt()
}

