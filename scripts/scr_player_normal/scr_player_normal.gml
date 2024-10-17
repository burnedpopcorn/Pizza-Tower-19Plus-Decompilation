function scr_player_normal() //scr_player_normal
{
    var _analogue = input_value("left") + input_value("right")
    var _suplexanim = spr_suplexdash
    var _jumpanim = spr_jump
    var _landanim = spr_land
    var _landmoveanim = spr_land2
    var _shouldturn = true
    var _animoverride = false
    var _fallanim = spr_fall
    if (global.currentpowerup == (1 << 0))
    {
        _suplexanim = spr_shotgunsuplexdash
        _jumpanim = spr_shotgunjump
        _landanim = spr_shotgunland
        _landmoveanim = spr_shotgunland
        _shouldturn = false
        _animoverride = true
        _fallanim = spr_shotgunfall
    }
    if (global.currentpowerup == (2 << 0))
    {
        _jumpanim = spr_player_pistoljump
        _landanim = spr_player_pistolland
        _landmoveanim = spr_player_pistolland
        _shouldturn = false
        _animoverride = true
    }
    hit_horizontal = function(argument0) //anon@812@scr_player_normal_scr_player_normal
    {
        if (sign(argument0) == xscale && state == (0 << 0))
        {
            movespeed = 0
            momemtum = 0
        }
    }

    hsp = move * movespeed
    if (dir != xscale)
    {
        dir = xscale
        facehurt = 0
        armhurt = 0
        introscared = 0
        turn = 1
        landAnim = 0
        image_index = 0
        movespeed = 2
    }
    if (move == (-xscale))
        momemtum = 0
    mach2 = 0
    jumpstop = 0
    snickmach2mode = 0
    snickmach3mode = 0
    cangrab = 1
    move = input_check_opposing("left", "right")
    if grounded
    {
        if (!_animoverride)
        {
            if ((!machslideAnim) && (!landAnim))
            {
                if (move == 0)
                {
                    turn = 0
                    if (sprite_index != spr_rageidle && sprite_index != spr_hurtidle)
                    {
                        if (idle < 400)
                            idle++
                    }
                    if (idle >= 150 && floor(image_index) == (image_number - 1))
                    {
                        facehurt = 0
                        armhurt = 0
                        introscared = 0
                        idle = 0
                        image_index = 0
                    }
                    if (idle >= 150 && sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3 && sprite_index != spr_idle4 && sprite_index != spr_idle5 && sprite_index != spr_idle6)
                    {
                        randomise()
                        idleanim = random_range(0, 100)
                        voice_random()
                        if (idleanim <= 16)
                            sprite_index = spr_idle1
                        if (idleanim > 16 && idleanim < 32)
                            sprite_index = spr_idle2
                        if (idleanim > 32 && idleanim < 48)
                            sprite_index = spr_idle3
                        if (idleanim > 48 && idleanim < 64)
                            sprite_index = spr_idle4
                        if (idleanim > 64 && idleanim < 80)
                            sprite_index = spr_idle5
                        if (idleanim > 80)
                            sprite_index = spr_idle6
                        image_index = 0
                    }
                    if (idle < 150)
                    {
                        if ((!facehurt) && (!armhurt) && (!introscared))
                        {
                            if (windingAnim < 1800 || angry || global.playerhealth == 1)
                            {
                                start_running = 1
                                movespeed = 0
                                if (global.escapetime <= 0 && global.panic && (!((global.stylethreshold >= 2 && global.combo > 0))) && (!obj_music.secret))
                                    sprite_index = spr_hurtidle
                                else if ((!((global.stylethreshold >= 2 && global.combo > 0))) && global.panic == 1 && (!obj_music.secret))
                                    sprite_index = spr_panic
                                else if (angry == 1 || global.stylethreshold == 2)
                                    sprite_index = spr_3hpidle
                                else if (global.stylethreshold == 3)
                                    sprite_index = spr_rageidle
                                else if ((!calmroom[room]) || character != "P")
                                    sprite_index = spr_idle
                                else
                                    sprite_index = spr_player_idlecalmer
                            }
                            else
                            {
                                idle = 0
                                windingAnim = 0
                            }
                        }
                        else
                        {
                            windingAnim = 0
                            if facehurt
                            {
                                if (sprite_index != spr_facehurtup && sprite_index != spr_facehurt)
                                    sprite_index = spr_facehurtup
                                if (floor(image_index) == (image_number - 1) && sprite_index == spr_facehurtup)
                                    sprite_index = spr_facehurt
                            }
                            else if armhurt
                            {
                                if (sprite_index != spr_armhurtup && sprite_index != spr_armhurt)
                                    sprite_index = spr_armhurtup
                                if (floor(image_index) == (image_number - 1) && sprite_index == spr_armhurtup)
                                    sprite_index = spr_armhurt
                            }
                            else if introscared
                            {
                                if (sprite_index != spr_player_startintro && sprite_index != spr_player_startidle)
                                    sprite_index = spr_player_startintro
                                if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_startintro)
                                    sprite_index = spr_player_startidle
                            }
                        }
                    }
                }
                if (move != 0)
                {
                    machslideAnim = 0
                    idle = 0
                    facehurt = 0
                    armhurt = 0
                    introscared = 0
                    if (!turn)
                    {
                        if (_analogue < 1 && movespeed <= 4)
                            sprite_index = spr_tiptoe
                        else if (global.escapetime <= 0 && global.panic && global.stylethreshold == 0)
                            sprite_index = spr_hurtwalk
                        else if (angry || global.stylethreshold == 2)
                            sprite_index = spr_3hpwalk
                        else if (global.stylethreshold == 3)
                            sprite_index = spr_ragemove
                        else
                            sprite_index = spr_move
                    }
                }
            }
        }
    }
    else
    {
        machslideAnim = 0
        idle = 0
        facehurt = 0
        armhurt = 0
        introscared = 0
        if (sprite_index != _fallanim)
        {
            sprite_index = _fallanim
            image_index = 0
        }
    }
    if (sprite_index == spr_Shotgun && floor(image_index) == (image_number - 1))
        sprite_index = spr_shotgunidle
    if turn
    {
        if (character != "S" && _shouldturn)
        {
            sprite_index = spr_moveturn
            if (floor(image_index) == (image_number - 1))
            {
                turn = 0
                sprite_index = spr_move
                image_index = 0
            }
        }
        else
            turn = 0
    }
    if landAnim
    {
        if (character == "S")
            landAnim = 0
        if (move == 0)
        {
            sprite_index = _landanim
            if (floor(image_index) == (image_number - 1))
                landAnim = 0
        }
        if (move != 0)
        {
            sprite_index = _landmoveanim
            if (floor(image_index) == (image_number - 1))
            {
                landAnim = 0
                sprite_index = spr_move
                image_index = 0
            }
        }
    }
    if machslideAnim
    {
        sprite_index = spr_machslideend
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_machslideend)
            machslideAnim = 0
    }
    if (!landAnim)
    {
        if (global.currentpowerup == (1 << 0))
        {
            if (sprite_index != spr_Shotgun)
                sprite_index = (move == 0 ? spr_shotgunidle : spr_shotgunwalk)
        }
        if (global.currentpowerup == (2 << 0))
        {
            var _idle = spr_player_pistolidle
            if input_check("up")
                _idle = spr_player_pistolidleup
            sprite_index = (move == 0 ? _idle : spr_player_pistolwalk)
        }
    }
    if ((!grounded) && (!input_check_pressed("jump")) && sprite_index != spr_suplexgrabcancel && coyotetime == 0)
    {
        if (sprite_index != _fallanim)
        {
            sprite_index = _fallanim
            image_index = 0
        }
        jumpAnim = 0
        state = (36 << 0)
        facehurt = 0
        armhurt = 0
        introscared = 0
    }
    if (input_check_pressed("jump") && (grounded || coyotetime > 0) && (!input_check("down")))
    {
        coyotetime = 0
        scr_fmod_soundeffect(char_jumpsnd, x, y)
        sprite_index = _jumpanim
        with (instance_create_depth(x, y, 0, obj_highjumpcloud2))
            image_xscale = other.xscale
        if (character != "N" || (character == "N" && (!pogo)))
            vsp = -11
        else
            vsp = -10
        state = (36 << 0)
        image_index = 0
        jumpAnim = 1
        facehurt = 0
        armhurt = 0
        introscared = 0
    }
    if (grounded && input_buffer_jump < 8 && (!input_check("down")) && (!input_check("dash")) && vsp > 0)
    {
        scr_fmod_soundeffect(char_jumpsnd, x, y)
        sprite_index = _jumpanim
        with (instance_create_depth(x, y, 0, obj_highjumpcloud2))
            image_xscale = other.xscale
        stompAnim = 0
        if (character != "N")
            vsp = -11
        else
            vsp = -10
        state = (36 << 0)
        jumpAnim = 1
        jumpstop = 0
        image_index = 0
        freefallstart = 0
        facehurt = 0
        armhurt = 0
        introscared = 0
    }
    if (character != "S" && (input_check("down") || (mask_index == spr_crouchmask && scr_solid(x, (y - 16)))) && grounded)
    {
        state = (43 << 0)
        landAnim = 0
        crouchAnim = 1
        image_index = 0
        idle = 0
        facehurt = 0
        armhurt = 0
        introscared = 0
        momemtum = 0
        return;
    }
    if (input_check("down") && grounded && character == "S" && movespeed >= 1)
    {
        suplexmove = 0
        momemtum = 1
        grav = 0.5
        sprite_index = spr_crouchslip
        machhitAnim = 0
        state = (45 << 0)
        if (movespeed < 8)
            movespeed = 8
    }
    if (move != 0)
    {
        xscale = move
        if (move != 0)
            image_speed = 0.1 + ((character != "P" && character != "N") ? 0.5 : 0.3) * (movespeed / 8)
        movespeed = Approach(movespeed, (8 * _analogue), 0.5)
    }
    else
    {
        movespeed = 0
        image_speed = 0.35
    }
    if (sprite_index == _fallanim || turn)
        image_speed = 0.35
    if (!momemtum)
    {
        if (movespeed > 8)
            movespeed -= 0.1
    }
    if (input_check("dash") && (!(place_meeting((x + xscale), y, obj_solid))))
    {
        if (character != "N" || (character == "N" && (!pogo)))
        {
            if (movespeed < 6)
                movespeed = 6
            sprite_index = spr_mach1
            state = (47 << 0)
            image_index = 0
            jumpAnim = 1
            facehurt = 0
            armhurt = 0
            introscared = 0
        }
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
            sprite_index = _suplexanim
            movespeed = 10
            with (instance_create_depth(x, y, 0, obj_dashcloud2))
                image_xscale = other.xscale
            facehurt = 0
            armhurt = 0
            introscared = 0
            momemtum = 1
        }
    }
    scr_playertaunt()
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
        shoryukenvsp = -14
        canuppercut = 0
        scr_fmod_soundeffectONESHOT("event:/sfx/player/uppercut", x, y)
        with (instance_create_depth(x, y, 0, obj_highjumpcloud2))
            image_xscale = other.xscale
        jumpAnim = 1
        facehurt = 0
        armhurt = 0
        introscared = 0
    }
    if (input_check_pressed("shoot") && global.currentpowerup == (2 << 0))
    {
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
        facehurt = 0
        armhurt = 0
        introscared = 0
    }
    if (sprite_index == spr_suplexgrabcancel && state != (36 << 0))
        state = (36 << 0)
    throwmort()
    var _walkframecheck = (floor(image_index) == 2 || floor(image_index) == 8 || floor(image_index) == 14 || floor(image_index) == 20 || floor(image_index) == 29 || floor(image_index) == 35 || floor(image_index) == 41 || floor(image_index) == 47)
    if (sprite_index != spr_moveturn && sprite_index != _fallanim && (!landAnim) && move != 0 && _walkframecheck && steppy == 0)
    {
        instance_create_depth(x, (y + 43), 0, obj_cloudeffect)
        scr_fmod_soundeffectONESHOT("event:/sfx/player/step", x, y)
        steppy = 1
    }
    if (sprite_index != spr_moveturn && (!landAnim) && move != 0 && (!_walkframecheck))
        steppy = 0
}

