function scr_player_chainsaw() //scr_player_chainsaw
{
    if (sprite_index != spr_player_chainsawbumpwall)
    {
        if (!instance_exists(obj_chainsaweffect))
            instance_create_depth(x, y, 0, obj_chainsaweffect)
        if (!instance_exists(obj_chainsawhitbox))
            instance_create_depth(x, y, 0, obj_chainsawhitbox)
    }
    var canmach3 = 50
    if (canmach3 > 0)
        canmach3 -= 0.5
    if (canmach3 <= 0)
        canmach3 = 0
    hsp = xscale * movespeed
    if (sprite_index == spr_player_chainsawhold || sprite_index == spr_player_chainsawstartup)
    {
        if grounded
        {
            if (movespeed > 0)
                movespeed -= 0.4
            if (movespeed <= 0)
                movespeed = 0
        }
    }
    if ((!input_check("shoot")) && sprite_index != spr_player_chainsawdashstart && sprite_index != spr_player_chainsawdash)
    {
        movespeed = 6
        bumped = 1
        vsp = -5
        sprite_index = spr_player_chainsawdashstart
        image_index = 0
        with (instance_create_depth(x, y, 0, obj_dashcloud))
            image_xscale = other.xscale
    }
    if (sprite_index == spr_player_chainsawdash || sprite_index == spr_player_chainsawdashstart)
    {
        if (movespeed < 15)
            movespeed += 2
        if (movespeed >= 15)
            movespeed = 15
        if (input_check("dash") && canmach3 <= 0 && grounded)
        {
            state = (66 << 0)
            sprite_index = spr_dashpad
            image_index = 0
        }
        if (input_buffer_jump < 8 && grounded && sprite_index == spr_player_chainsawdash)
        {
            sprite_index = spr_player_chainsawdashstart
            image_index = 0
            vsp = -10
        }
    }
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5 && (!stompAnim) && (!bumped))
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (sprite_index == spr_player_chainsawair && grounded && vsp > 0)
    {
        sprite_index = spr_player_chainsawdash
        image_index = 0
    }
    if (sprite_index == spr_player_chainsawstartup && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_player_chainsawhold
        image_index = 0
    }
    if (sprite_index == spr_player_chainsawdashstart && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_player_chainsawdash
        image_index = 0
    }
    if (scr_solid((x + xscale), y) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && sprite_index != spr_player_chainsawstartup && sprite_index != spr_player_chainsawhold)
    {
        hsp = -5
        image_index = 0
        state = (15 << 0)
        vsp = -3
        scr_fmod_soundeffectONESHOT("event:/sfx/player/bump", x, y)
        scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
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
        instance_create_depth((x + 10 * xscale), (y + 10), 0, obj_bumpeffect)
        camera_shake(20, 40)
    }
    if (sprite_index == spr_player_chainsawbumpwall && grounded && vsp > 0)
    {
        hsp = 0
        movespeed = 0
    }
    if (sprite_index == spr_player_chainsawbumpwall && floor(image_index) == (image_number - 1))
    {
        state = (0 << 0)
        hsp = 0
        image_index = 0
    }
    if ((!instance_exists(obj_dashcloud)) && grounded && sprite_index != spr_player_chainsawstartup && sprite_index != spr_player_chainsawhold)
    {
        with (instance_create_depth(x, y, 0, obj_dashcloud))
            image_xscale = other.xscale
    }
    if (sprite_index == spr_player_chainsawdash && input_check("dash") && grounded && floor(image_index) == (image_number - 1))
    {
        state = (47 << 0)
        with (instance_create_depth(x, y, 0, obj_dashcloud))
            image_index = other.xscale
        movespeed = 12
    }
    image_speed = 0.35
}

