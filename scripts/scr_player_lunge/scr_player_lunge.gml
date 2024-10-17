function scr_player_lunge() //scr_player_lunge
{
    collide_destructibles = function(argument0, argument1) //anon@55@scr_player_lunge_scr_player_lunge
    {
        scr_destroy_horizontal(argument0)
    }

    hit_horizontal = function(argument0) //anon@130@scr_player_lunge_scr_player_lunge
    {
        if grounded
        {
            if scr_bump_rat(argument0)
                return;
            scr_fmod_soundeffectONESHOT("event:/sfx/player/bump", x, y)
            jumpstop = 1
            grounded = 0
            state = (36 << 0)
            vsp = -4
            image_index = 0
            instance_create_depth((x + xscale * 10), (y + 10), 0, obj_bumpeffect)
            sprite_index = spr_wallbump
            gamepadvibrate(0.4, 0, 7)
            bumped = 1
        }
        else
        {
            if (character != "P")
                sprite_index = spr_machclimbwall
            else if (character == "P")
                sprite_index = spr_player_climbwall
            wallspeed = movespeed
            state = (12 << 0)
            wallclimbtime = 10
            lunge = 1
        }
    }

    hsp = xscale * movespeed
    move = input_check_opposing("left", "right")
    landAnim = 0
    if (!lunge)
        vsp = 0
    if (movespeed < 14)
        movespeed = Approach(movespeed, 14, 0.25)
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_ragelunge)
    {
        image_speed = 0.35
        grav = 0.5
        state = (47 << 0)
    }
    if (!pummelpunch)
    {
        if (input_buffer_jump < 8 && (!pummeldoublejump) && (!input_check("down")))
        {
            input_buffer_jump = 8
            coyotetime = 0
            jumpstop = 0
            pummeldoublejump = true
            image_index = 0
            vsp = -10
            longjumping = 1
            longjumpspd = movespeed * xscale
            sprite_index = spr_longjumpstart
            state = (47 << 0)
            scr_fmod_soundeffect(longjumpsnd, x, y)
            instance_create_depth(x, y, 0, obj_highjumpcloud2)
        }
        if (move != xscale && move != 0)
        {
            flash = 1
            state = (36 << 0)
            sprite_index = spr_suplexgrabcancel
            image_index = 0
            jumpAnim = 1
            movespeed = 2
            momemtum = 1
            scr_fmod_soundeffectONESHOT("event:/sfx/player/grabcancel", x, y)
            lunge = 1
        }
    }
    image_speed = 0.35
    blurafterimageeffect(3, 0.05)
    if ((!instance_exists(obj_dashcloud)) && grounded)
    {
        with (instance_create_depth(x, y, 0, obj_dashcloud))
            image_xscale = other.xscale
    }
    if (!instance_exists(obj_grabhitbox))
    {
        with (instance_create_depth(x, y, 0, obj_grabhitbox))
        {
            playerid = other.id
            image_xscale = other.id.xscale
        }
    }
}

