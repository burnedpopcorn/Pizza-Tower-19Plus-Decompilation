function scr_player_tacklecharge() //scr_player_tacklecharge
{
    if (windingAnim < 2000)
        windingAnim++
    hsp = xscale * movespeed
    move2 = input_check_opposing_pressed("left", "right")
    move = input_check_opposing("left", "right")
    movespeed = 10
    crouchslideAnim = 1
    if (movespeed < 24 && move == xscale)
        movespeed += 0.05
    if (input_buffer_attack < 8)
    {
        state = (29 << 0)
        image_index = 1
        image_speed = 0.35
        hsp = 0
    }
    if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5)
    {
        vsp /= 10
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && grounded)
    {
        scr_fmod_soundeffect(char_jumpsnd, x, y)
        vsp = -11
    }
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if (scr_solid((x + xscale), y) && (!(place_meeting((x + xscale), y, obj_slope))))
    {
        with (baddiegrabbedID)
        {
            grabbed = 0
            grav = 0.5
            instance_create_depth(x, y, 0, obj_bangeffect)
            scr_enemygibs(1)
            flash = 1
            add_combo()
            hp -= 5
            alarm[1] = 5
            thrown = 1
            x = obj_player.x
            y = obj_player.y
            state = 104
            hsp = (-image_xscale) * 10
            vsp = -10
            camera_shake(3, 3)
        }
        movespeed = 0
        state = (49 << 0)
        hsp = -2.5 * xscale
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create_depth((x + 10 * xscale), (y + 10), 0, obj_bumpeffect)
    }
    sprite_index = spr_charge
    image_speed = 0.65
    if (input_check("down") && grounded)
    {
        sprite_index = spr_crouchslip
        if (character == "P")
            machhitAnim = 0
        state = (45 << 0)
    }
    if ((!input_check("dash")) && move != xscale && grounded)
    {
        image_index = 0
        state = (48 << 0)
        scr_fmod_soundeffect(char_machbreaksnd, x, y)
        sprite_index = spr_machslidestart
    }
    if (move == (-xscale) && grounded)
    {
        image_index = 0
        state = (48 << 0)
        sprite_index = spr_machslideboost
    }
    if (move == xscale && (!input_check("dash")) && grounded)
        state = (0 << 0)
    if ((!instance_exists(obj_dashcloud)) && grounded)
        instance_create_depth(x, y, 0, obj_dashcloud)
}

