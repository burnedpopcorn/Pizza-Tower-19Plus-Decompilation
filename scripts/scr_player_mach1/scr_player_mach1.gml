function scr_player_mach1() //scr_player_mach1
{
    collide_destructibles = function(argument0, argument1) //anon@55@scr_player_mach1_scr_player_mach1
    {
        scr_destroy_horizontal(argument0)
    }

    hit_horizontal = function(argument0) //anon@131@scr_player_mach1_scr_player_mach1
    {
        if (((!grounded) || (grounded && scr_slope())) && (!rocket))
        {
            sprite_index = spr_player_climbwall
            wallspeed = movespeed
            state = (12 << 0)
        }
        else
        {
            state = (49 << 0)
            sprite_index = spr_player_wallsplat
            gamepadvibrate(0.4, 0, 7)
            image_index = 0
            mach2 = 0
            movespeed = 0
        }
    }

    dir = xscale
    move = input_check_opposing("left", "right")
    landAnim = 0
    machhitAnim = 0
    crouchslideAnim = 1
    hsp = xscale * movespeed
    if (xscale == 1 && move == -1)
    {
        sprite_index = spr_mach1
        momemtum = 0
        mach2 = 0
        movespeed = 6
        image_index = 0
        xscale = -1
    }
    if (xscale == -1 && move == 1)
    {
        sprite_index = spr_mach1
        momemtum = 0
        mach2 = 0
        movespeed = 6
        image_index = 0
        xscale = 1
    }
    if (grounded && (!input_check("dash")) && character != "S")
    {
        state = (0 << 0)
        image_index = 0
    }
    if (move == 0 && character == "S")
    {
        state = (0 << 0)
        image_index = 0
    }
    if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5)
    {
        vsp /= 10
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    image_speed = 0.5
    if ((!instance_exists(obj_dashcloud)) && grounded)
    {
        with (instance_create_depth(x, y, 0, obj_dashcloud))
            image_xscale = other.xscale
    }
    if grounded
    {
        if (scr_slope_ext(x, (y + 1)) && vsp >= 0)
        {
            with (instance_place(x, (y + 1), obj_slope))
            {
                var slope_acceleration = abs(image_yscale) / abs(image_xscale)
                if (other.xscale == sign(image_xscale))
                {
                    if (other.movespeed > 6)
                        other.movespeed -= (0.2 * slope_acceleration)
                }
                else if (other.xscale == (-sign(image_xscale)))
                {
                    if (other.movespeed < 24)
                        other.movespeed += (0.2 * slope_acceleration)
                }
            }
        }
        movespeed += (0.075 + conveyor)
        if (sprite_index == spr_mach1 && floor(image_index) == (image_number - 1))
        {
            state = (47 << 0)
            with (instance_create_depth(x, y, 0, obj_jumpdust))
                image_xscale = other.xscale
        }
    }
    if (grounded && sprite_index != spr_mach1 && vsp > 0)
    {
        sprite_index = spr_mach1
        image_index = 0
    }
    if (input_check_pressed("jump") && grounded)
    {
        coyotetime = 0
        scr_fmod_soundeffect(char_jumpsnd, x, y)
        state = (47 << 0)
        sprite_index = spr_secondjump1
        dir = xscale
        momemtum = 1
        vsp = -11
        jumpAnim = 1
        image_index = 0
    }
    if ((!grounded) && (!input_check_pressed("jump")))
    {
        state = (47 << 0)
        sprite_index = spr_secondjump1
        dir = xscale
        jumpAnim = 1
        image_index = 0
    }
    scr_playertaunt()
    if (character == "P" && input_check("up") && input_buffer_attack < 8 && canuppercut && grounded)
    {
        input_buffer_attack = 8
        state = (75 << 0)
        sprite_index = spr_shoryukenstart
        image_index = 0
        if (hsp > 0)
            hsp = movespeed
        if (hsp < 0)
            hsp = (-movespeed)
        shoryukenvsp = -8
        canuppercut = 0
        with (instance_create_depth(x, y, 0, obj_highjumpcloud2))
            image_xscale = other.xscale
        jumpAnim = 1
        with (instance_create_depth(x, y, 0, obj_superdashcloud))
            image_xscale = other.xscale
        facehurt = 0
        armhurt = 0
        introscared = 0
    }
    if (input_check("shoot") && global.currentpowerup == (1 << 0))
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/player/killingblow", x, y)
        state = (103 << 0)
        with (instance_create_depth(x, y, 0, obj_pistoleffect))
            image_xscale = other.xscale
        image_index = 0
        sprite_index = spr_Shotgun
        if (!grounded)
            vsp = -5
        if (character != "N")
        {
            instance_create_depth((x + image_xscale * 20), (y + 20), 0, obj_shotgunbullet)
            with (instance_create_depth((x + image_xscale * 20), (y + 20), 0, obj_shotgunbullet))
            {
                spdh = 4
                playerid = other.playerobj
            }
            with (instance_create_depth((x + image_xscale * 20), (y + 20), 0, obj_shotgunbullet))
            {
                spdh = -4
                playerid = other.playerobj
            }
        }
    }
    if (input_buffer_attack < 8 && character != "S" && (!input_check("up")))
    {
        input_buffer_attack = 8
        if (global.currentbadge == (1 << 0))
        {
            if (!kungfumove)
            {
                kungfumove = 1
                state = (91 << 0)
                scr_fmod_soundeffectONESHOT("event:/sfx/player/kungfu", x, y)
                if (movespeed < 10)
                    movespeed = 10
                if grounded
                    sprite_index = choose(spr_kungfu1, spr_kungfu2, spr_kungfu3)
                else
                    sprite_index = choose(spr_kungfuair1start, spr_kungfuair2start, spr_kungfuair3start)
                image_index = 0
                with (instance_create_depth(x, y, -99, obj_shoulderbashcrazyrunothereffect))
                {
                    playerid = other.playerobj
                    other.shoulderbashcrazyrunothereffectid = id
                }
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
            with (instance_create_depth(x, y, -99, obj_shoulderbashcrazyrunothereffect))
            {
                playerid = other.playerobj
                other.shoulderbashcrazyrunothereffectid = id
            }
            if ((!instance_exists(obj_superdashcloud)) && grounded)
            {
                with (instance_create_depth(x, y, 0, obj_superdashcloud))
                    image_xscale = other.xscale
            }
        }
        momemtum = 1
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
    if (input_check("down") && (!(place_meeting(x, y, obj_dashpad))))
    {
        if grounded
            instance_create_depth(x, y, 0, obj_jumpdust)
        flash = 0
        state = (23 << 0)
        image_index = 0
        vsp = 10
    }
    throwmort()
}

